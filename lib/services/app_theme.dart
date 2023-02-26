import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
//color stream

  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF212121),
          unselectedItemColor: Colors.white),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color.fromARGB(255, 11, 83, 93),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 11, 83, 93),
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Color.fromARGB(255, 11, 83, 93)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Color.fromARGB(255, 11, 83, 93),
          unselectedItemColor: Colors.white),
    ),
  };
}
