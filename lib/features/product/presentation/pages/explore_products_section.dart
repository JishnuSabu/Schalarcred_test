import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/images_path/images.dart';

class ExploreProductsSection extends StatelessWidget {
  const ExploreProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 979,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: _buildTextContent()),
              const SizedBox(width: 60),
              Expanded(flex: 5, child: _buildImageGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return SizedBox(
      height: 525,
      width: 519,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore Our Products',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF000000),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF000000),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Larem lpsu',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF000000),
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildImageCard(
                'Leather Bags',
                'Lorem Ipsum is simply dummy text',
                Images.bag,
                height: 449,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildImageCard(
                '',
                '',
                Images.bangles,
                height: 449,
                hideOverlay: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildImageCard(
                '',
                '',
                Images.girlwithbag,
                height: 449,
                hideOverlay: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildImageCard(
                'Different Types',
                'Lorem Ipsum is simply dummy text',
                Images.jeans,
                height: 449,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageCard(
    String title,
    String subtitle,
    String imageUrl, {
    required double height,
    bool hideOverlay = false,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
      child: hideOverlay
          ? const SizedBox.shrink()
          : Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
