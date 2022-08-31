// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart'; 
import 'package:job_test_task/models/weather.dart';
import 'package:job_test_task/repositories/geolocator_repo.dart';
import 'package:job_test_task/repositories/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GeolocatorRepo geolocatorRepo;
  final WeatherRepo weatherRepo;

  WeatherBloc(
      {required this.geolocatorRepo,
      required this.weatherRepo,
      required WeatherState initialState})
      : assert(geolocatorRepo != null),
        super(initialState) {
    add(AppStarted());
  }
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeatherEvent) {
      try {
        yield WeatherLoadingState();
        late final Position _currentLocation;
        late final String _currentAddress;
        late final Weather _weatherDetail;
        _currentLocation = await geolocatorRepo.getCurrentLocation();
        _currentAddress =
            await geolocatorRepo.reverseGeoCoding(_currentLocation);
        _weatherDetail = await weatherRepo.fetchWeatherData(_currentLocation);
        var fahrenheitValue = 1.8 * _weatherDetail.temp +32; 
        yield WeatherLoadedState(
            weatherDetails:
                "Weather for ${_currentAddress.toString()}: ${_weatherDetail.temp.toString()}°C ($fahrenheitValue°F)");
      } catch (e) {
        yield WeatherErrorState(errorMessage: e.toString());
      }
    }
  }
}
