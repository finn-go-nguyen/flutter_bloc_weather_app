import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../weather/presentation/pages/weather_page_arguments.dart';
import '../bloc/search_bloc.dart';
import 'widgets.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is Initial) {
          return Container();
        } else if (state is Empty) {
          return const Text(
            'City not found!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          );
        } else if (state is Error) {
          return Text(
            state.message,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          );
        } else if (state is Loaded) {
          return ListView.separated(
            separatorBuilder: (context, index) => Container(
              color: Colors.grey[300],
              height: 1,
              width: double.infinity,
            ),
            itemCount: state.locations.length,
            itemBuilder: (context, index) => LocationTile(
              location: state.locations[index],
              onTap: () {
                Navigator.pop(
                  context,
                  WeatherPageArguments(
                    location: state.locations[index].name,
                    lat: state.locations[index].lat,
                    lon: state.locations[index].lon,
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
