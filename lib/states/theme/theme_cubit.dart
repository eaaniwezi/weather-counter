// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system));

  void toggleTheme() => emit(ThemeState(
        themeMode: state.themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark,
      ));
}
