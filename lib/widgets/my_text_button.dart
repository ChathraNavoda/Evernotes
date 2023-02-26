import 'package:evernotes/constants/global_variables.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        width: 300,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: const TextStyle(color: GlobalVariables.secondaryColordark),
          ),
          style: TextButton.styleFrom(backgroundColor: bgColor),
        ),
      ),
    );
  }
}
