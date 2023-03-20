import 'package:flutter/material.dart';
import 'package:casper/utilites.dart';

class CustomisedButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final width, height, text, onPressed;
  const CustomisedButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff12141D),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: SafeGoogleFont(
              'Ubuntu',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.2175,
              color: const Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}