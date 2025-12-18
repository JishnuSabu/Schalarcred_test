import 'package:flutter/material.dart';

Widget buildStarRating(double rating) {
  return Row(
    children: List.generate(5, (index) {
      return Icon(
        index < rating.floor() ? Icons.star : Icons.star_border,
        color: Colors.orange,
        size: 16,
      );
    }),
  );
}
