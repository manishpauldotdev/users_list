import 'package:flutter/material.dart';

class UserOnboardingButton extends StatelessWidget {
  final String route;
  final String textTitle;
  final Color buttonColor;

  const UserOnboardingButton({
    super.key,
    required this.route,
    required this.textTitle,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed(route),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth * 0.4, screenHeight * 0.06),
        backgroundColor: buttonColor,
        side: buttonColor == Colors.blue
            ? null
            : const BorderSide(
                width: 1,
                color: Colors.black,
              ),
        foregroundColor:
            buttonColor == Colors.blue ? Colors.white : Colors.black,
      ),
      child: Text(
        textTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
