import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSmall;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final actualIsSmall = isSmall || MediaQuery.of(context).size.width < 768;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Color(0xFFFFFFFF), width: 2),
        padding: EdgeInsets.symmetric(
          horizontal: actualIsSmall ? 16 : 32,
          vertical: actualIsSmall ? 8 : 12,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: actualIsSmall ? 12 : 14,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
