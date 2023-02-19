import 'package:flutter/material.dart';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      const Color(0xff194c23),
      Color.fromARGB(255, 112, 183, 12),
    ],
    stops: [0.5, 1.0],
  );

  //sizes

  static const secondaryColor = Color.fromARGB(255, 10, 10, 105);
  static Color darkGreenColor = const Color(0xff194c23);
  static Color lightGreenColor = Color.fromARGB(255, 105, 172, 38);
  static Color containerGreenColor = Color.fromARGB(255, 163, 209, 140);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greenBackgroundCOlor = Color.fromARGB(255, 228, 248, 218);
  static var selectedNavBarColor = Color.fromARGB(255, 10, 143, 0);
  static const unselectedNavBarColor = Colors.black87;
}
