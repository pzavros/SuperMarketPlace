import 'package:flutter/material.dart';

// Light Mode Colors
const Color light1 = Color(0xFFFFD83D); //primary
const Color light2 = Color(0xFFFF8400); //secondary
const Color light3 = Color(0xFF5A7C7C); //3th
const Color light4 = Color(0xFF5A7C7C); //4th
const Color light5 = Color(0xFFDBDBDB); //5th

// Dark Mode Colors
const Color dark1 = Color(0xFF242424);
const Color dark2 = Color(0xFFFFD83D);
const Color dark3 = Color(0xFFFF8400);
const Color dark4 = Color(0xFF83A5A5);
const Color dark5 = Color(0xFF83A5A5);

// Light Theme
final ThemeData lightTheme = ThemeData(
  primaryColor: light5,
  scaffoldBackgroundColor: light5,
  appBarTheme: AppBarTheme(
    color: light5,
    iconTheme: IconThemeData(color: dark1),
  ),
  colorScheme: ColorScheme.light(
    primary: light1,
    secondary: light3,
    surface: light5,
    onPrimary: dark1,
    onSecondary: dark2,
    onSurface: dark3,
    error: Colors.red.shade800,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(color: light1),
    headline2: TextStyle(color: light2),
    bodyText1: TextStyle(color: light3),
    bodyText2: TextStyle(color: light4),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: light1,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  primaryColor: dark1,
  scaffoldBackgroundColor: dark1,
  appBarTheme: AppBarTheme(
    color: dark1,
    iconTheme: IconThemeData(color: light3),
  ),
  colorScheme: ColorScheme.dark(
    primary: dark1,
    secondary: dark3,
    surface: dark4,
    onPrimary: light2,
    onSecondary: light3,
    onSurface: light4,
    error: Colors.red.shade200,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(color: dark2),
    headline2: TextStyle(color: dark3),
    headline3: TextStyle(color: light5),
    bodyText1: TextStyle(color: dark4),
    bodyText2: TextStyle(color: light5),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: dark3,
    textTheme: ButtonTextTheme.primary,
  ),
);
