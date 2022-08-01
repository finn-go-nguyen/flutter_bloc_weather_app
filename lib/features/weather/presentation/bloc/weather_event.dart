// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends WeatherEvent {
  final double lat;
  final double lon;

  const FetchDataEvent({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object> get props => [lat, lon];
}
