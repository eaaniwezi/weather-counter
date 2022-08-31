part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}class AppStarted extends WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {}
