import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/images_path/images.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/cm_outlined_button.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_advertisement_card.dart';

class HexaShopAdvertisementSection extends StatelessWidget {
  const HexaShopAdvertisementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: SizedBox(
        height: 563,
        child: Row(
          children: [
            Expanded(child: _buildHeroCard()),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: hexaShopAdvertisementCard(
                            'Women',
                            Images.women,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: hexaShopAdvertisementCard('Men', Images.men),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: hexaShopAdvertisementCard('Kids', Images.kids),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: hexaShopAdvertisementCard(
                            'Accessories',
                            Images.accessories,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: const DecorationImage(
          image: AssetImage(Images.image1),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
              Colors.transparent,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'We Are Hexashop',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
              const Text(
                'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 10),
              CustomOutlinedButton(text: 'Purchase Now', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
