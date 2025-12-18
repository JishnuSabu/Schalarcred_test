import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final BorderRadius borderRadius;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.borderWidth = 2,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor, width: borderWidth),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
