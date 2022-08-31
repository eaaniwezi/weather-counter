// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment(ThemeMode themeMode) {
    var val = themeMode == ThemeMode.dark ? 2 : 1;

    emit(
      CounterState(
          counterValue: state.counterValue >= 9
              ? state.counterValue + 1
              : state.counterValue + val),
    );
  }

  void decrement(ThemeMode themeMode) {
    var val = themeMode == ThemeMode.dark ? 2 : 1;
    emit(
      CounterState(
        counterValue: state.counterValue <= 1
            ? state.counterValue - 1
            : state.counterValue -val,
      ),
    );
  }
}
