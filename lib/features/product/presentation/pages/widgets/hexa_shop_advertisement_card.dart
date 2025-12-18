import 'package:flutter/material.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/cm_outlined_button.dart';

Widget hexaShopAdvertisementCard(String title, String imageUrl) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
          const Text(
            'Lorem Ipsum is simply dummy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18,
              fontFamily: 'Inter',
            ),
          ),
          CustomOutlinedButton(text: 'Discover More', onPressed: () {}),
        ],
      ),
    ),
  );
}
