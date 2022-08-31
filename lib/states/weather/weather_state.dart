part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final String weatherDetails;

  const WeatherLoadedState({required this.weatherDetails});
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  const WeatherErrorState({required this.errorMessage});
}
