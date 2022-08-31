// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test_task/states/counter/counter_cubit.dart';
import 'package:job_test_task/states/weather/weather_bloc.dart';
import 'package:job_test_task/widgets/bottom_nav_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final ThemeMode themeMode;
  const HomeScreen({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomNavBarWidget(themeMode: themeMode),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Weather Counter"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  state.weatherDetails,
                  textAlign: TextAlign.center,
                ),
              );
            }
            if (state is WeatherLoadingState) {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColorLight,
              ));
            }
            if (state is WeatherErrorState) {
              return Center(
                child: Text(
                  "Oops!!\nCouldn't get your location",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return Center(
              child: Text(
                "Press the icon to get your location",
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
        SizedBox(height: 35),
        Center(
          child: Text(
            "You have pushed the button this many times:",
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Center(
              child: Text(
                state.counterValue.toString(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
