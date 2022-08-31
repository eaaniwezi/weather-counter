// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test_task/const/app_theme.dart';
import 'package:job_test_task/screens/home_screen.dart';
import 'package:job_test_task/states/theme/theme_cubit.dart';
import 'package:job_test_task/repositories/weather_repo.dart';
import 'package:job_test_task/states/weather/weather_bloc.dart';
import 'package:job_test_task/repositories/geolocator_repo.dart';
import 'package:job_test_task/states/counter/counter_cubit.dart';

void main() {
  final geolocatorRepo = GeolocatorRepo();
  final weatherRepo = WeatherRepo();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
      ),
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(
          initialState: WeatherInitial(),
          geolocatorRepo: geolocatorRepo,
          weatherRepo: weatherRepo,
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Weather Counter',
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: HomeScreen(themeMode: state.themeMode),
        );
      },
    );
  }
}
