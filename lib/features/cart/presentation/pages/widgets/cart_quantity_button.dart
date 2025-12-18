import 'package:flutter/material.dart';

Widget cartQuantityButton(
  BuildContext context,
  String label,
  VoidCallback onPressed,
) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
