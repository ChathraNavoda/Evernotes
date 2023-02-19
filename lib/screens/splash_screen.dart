import 'dart:async';

import 'package:evernotes/constants/global_variables.dart';

import 'package:evernotes/views/onboarding_page.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFAE5EA),
              Color(0xFFCAEDFA),
              Color(0xFFF9AECA),
              Color(0xFFF992A9),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Center(
                  child: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_z4cshyhf.json'),
                ),
              ],
            ),
            const Text(
              "Evernotes",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: GlobalVariables.secondaryColor),
            ),
            const Text(
              "Life is easy when you plan everything",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: GlobalVariables.secondaryColor),
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
