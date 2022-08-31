// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xff121212),
    primaryColorLight: Colors.teal,
     iconTheme: IconThemeData(color: Colors.black),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColorLight: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
    primaryColor: Colors.blue,
  );
}
