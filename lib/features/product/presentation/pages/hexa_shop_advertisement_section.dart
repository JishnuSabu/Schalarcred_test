import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/images_path/images.dart';
import 'package:scholarcred_test/core/responsive/responsive.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/cm_outlined_button.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_advertisement_card.dart';

class HexaShopAdvertisementSection extends StatelessWidget {
  const HexaShopAdvertisementSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = ResponsiveConstants.getHorizontalPadding(context);
    final sectionHeight = ResponsiveConstants.getAdvertisementSectionHeight(
      context,
    );

    if (width < ResponsiveConstants.tabletBreakpoint) {
      return _buildMobileLayout(context, padding, sectionHeight);
    } else if (width < ResponsiveConstants.desktopBreakpoint) {
      return _buildTabletLayout(context, padding, sectionHeight);
    } else {
      return _buildDesktopLayout(context, padding, sectionHeight);
    }
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    double padding,
    double height,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(child: _buildHeroCard(context)),
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
                            context: context,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: hexaShopAdvertisementCard(
                            'Men',
                            Images.men,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: hexaShopAdvertisementCard(
                            'Kids',
                            Images.kids,
                            context: context,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: hexaShopAdvertisementCard(
                            'Accessories',
                            Images.accessories,
                            context: context,
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

  Widget _buildTabletLayout(
    BuildContext context,
    double padding,
    double height,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Expanded(flex: 2, child: _buildHeroCard(context)),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: hexaShopAdvertisementCard(
                      'Women',
                      Images.women,
                      context: context,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: hexaShopAdvertisementCard(
                      'Men',
                      Images.men,
                      context: context,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: hexaShopAdvertisementCard(
                      'Kids',
                      Images.kids,
                      context: context,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: hexaShopAdvertisementCard(
                      'Accessories',
                      Images.accessories,
                      context: context,
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

  Widget _buildMobileLayout(
    BuildContext context,
    double padding,
    double height,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Expanded(flex: 3, child: _buildHeroCard(context)),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: hexaShopAdvertisementCard(
                        'Women',
                        Images.women,
                        context: context,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: hexaShopAdvertisementCard(
                        'Men',
                        Images.men,
                        context: context,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: hexaShopAdvertisementCard(
                        'Kids',
                        Images.kids,
                        context: context,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: hexaShopAdvertisementCard(
                        'Accessories',
                        Images.accessories,
                        context: context,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < ResponsiveConstants.tabletBreakpoint;
    bool isTablet = width < ResponsiveConstants.desktopBreakpoint && !isMobile;

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
            begin: isMobile ? Alignment.topCenter : Alignment.centerLeft,
            end: isMobile ? Alignment.bottomCenter : Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(isMobile ? 0.7 : 0.6),
              Colors.black.withOpacity(isMobile ? 0.5 : 0.3),
              Colors.transparent,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  'We Are Hexashop',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: isMobile ? 36 : (isTablet ? 48 : 56),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 10),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                    fontFamily: 'Inter',
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 15 : 10),
                CustomOutlinedButton(
                  text: 'Purchase Now',
                  onPressed: () {},
                  isSmall: isMobile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
