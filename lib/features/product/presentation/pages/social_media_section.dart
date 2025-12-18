import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/images_path/images.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Lorem Ipsum is simply dummy text of the printingand typesetting industry.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              color: Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 281,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _getImageList().length,
              separatorBuilder: (context, index) => const SizedBox(width: 22),
              itemBuilder: (context, index) {
                return _buildImageCard(_getImageList()[index], 210, 281);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getImageList() {
    return [
      Images.dress,
      Images.purse,
      Images.image1,
      Images.makeup,
      Images.hat,
      Images.chappal,
    ];
  }

  Widget _buildImageCard(String imageUrl, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
