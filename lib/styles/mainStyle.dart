import 'package:flutter/material.dart';

// Define the color palette
const Color _darkPrimary = Color(0xFF0d1b2a);
const Color _darkSecondary = Color(0xFF1b263b);
const Color _darkAccent = Color(0xFF415a77);
const Color _lightPrimary = Color(0xFF778da9);
const Color _lightSecondary = Color(0xFFe0e1dd);

// Define the colors for the bottom navigation bar directly
const Color bottomNavBarBackgroundColor = _lightPrimary;
const Color bottomNavBarSelectedItemColor = _darkPrimary;
const Color bottomNavBarUnselectedItemColor = _darkAccent;

// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: _lightPrimary,
  scaffoldBackgroundColor: _lightSecondary,
  appBarTheme: AppBarTheme(
    color: _lightPrimary,
    iconTheme: IconThemeData(color: _darkPrimary),
  ),
  colorScheme: ColorScheme.light(
    primary: _lightPrimary,
    secondary: _darkAccent,
    surface: Colors.white,
    onPrimary: _darkPrimary,
    onSecondary: _darkPrimary,
    onSurface: _darkPrimary,
    error: Colors.red.shade800, // Customize as needed
  ),
  textTheme: TextTheme(
    headline1: TextStyle(color: _lightPrimary),
    headline2: TextStyle(color: _lightPrimary),
    bodyText1: TextStyle(color: _lightPrimary),
    bodyText2: TextStyle(color: _lightPrimary),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: _lightPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
  // Add other customizations for the light theme here
);



// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: _darkPrimary,
  scaffoldBackgroundColor: _darkSecondary,
  appBarTheme: AppBarTheme(
    color: _darkPrimary,
    iconTheme: IconThemeData(color: _lightSecondary),
  ),
  colorScheme: ColorScheme.dark(
    primary: _darkPrimary,
    secondary: _lightSecondary,
    surface: _darkSecondary,
    onPrimary: _lightSecondary,
    onSecondary: _lightSecondary,
    onSurface: _lightSecondary,
    error: Colors.red.shade200, // Customize as needed
  ),
  textTheme: TextTheme(
    headline1: TextStyle(color: _lightSecondary),
    headline2: TextStyle(color: _lightSecondary),
    bodyText1: TextStyle(color: _lightSecondary),
    bodyText2: TextStyle(color: _lightSecondary),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: _darkAccent,
    textTheme: ButtonTextTheme.primary,
  ),

  // Add other customizations for the dark theme here
);

