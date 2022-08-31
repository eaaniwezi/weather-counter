// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test_task/widgets/buttons.dart';
import 'package:job_test_task/states/theme/theme_cubit.dart';
import 'package:job_test_task/states/weather/weather_bloc.dart';
import 'package:job_test_task/states/counter/counter_cubit.dart';

class BottomNavBarWidget extends StatelessWidget {
  final ThemeMode themeMode;
  const BottomNavBarWidget({Key? key, required this.themeMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(
                  iconName: Icons.cloud,
                  onPress: () {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(GetWeatherEvent());
                  },
                ),
                Spacer(),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return state.counterValue == 10
                        ? Text("")
                        : Buttons(
                            iconName: Icons.add,
                            onPress: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .increment(themeMode);
                            },
                          );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(
                  iconName: Icons.palette,
                  onPress: () {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  },
                ),
                Spacer(),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return state.counterValue == 0
                        ? Text("")
                        : Buttons(
                            iconName: Icons.remove,
                            onPress: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .decrement(themeMode);
                            },
                          );
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
