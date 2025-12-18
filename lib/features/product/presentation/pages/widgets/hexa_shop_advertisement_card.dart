import 'package:flutter/material.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/cm_outlined_button.dart';

Widget hexaShopAdvertisementCard(
  String title,
  String imageUrl, {
  BuildContext? context,
  bool isSmall = false,
}) {
  // If no context provided (for backward compatibility), use default values
  final bool smallMode =
      isSmall || (context != null && MediaQuery.of(context).size.width < 768);
  final bool tabletMode =
      context != null &&
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;

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
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(smallMode ? 0.8 : 0.7),
          ],
        ),
      ),
      padding: EdgeInsets.all(smallMode ? 12 : (tabletMode ? 16 : 24)),
      child: Column(
        mainAxisAlignment: smallMode
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: smallMode ? 18 : (tabletMode ? 22 : 25),
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: smallMode ? 4 : 8),
          Text(
            'Lorem Ipsum is simply dummy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: smallMode ? 12 : (tabletMode ? 14 : 18),
              fontFamily: 'Inter',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: smallMode ? 8 : 16),
          CustomOutlinedButton(
            text: 'Discover More',
            onPressed: () {},
            isSmall: smallMode,
          ),
        ],
      ),
    ),
  );
}

// Alternative version that takes BuildContext directly
Widget hexaShopAdvertisementCardWithContext(
  String title,
  String imageUrl,
  BuildContext context,
) {
  final width = MediaQuery.of(context).size.width;
  final isMobile = width < 768;
  final isTablet = width >= 768 && width < 1024;

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
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(isMobile ? 0.8 : 0.7),
          ],
        ),
      ),
      padding: EdgeInsets.all(isMobile ? 12 : (isTablet ? 16 : 24)),
      child: Column(
        mainAxisAlignment: isMobile
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: isMobile ? 18 : (isTablet ? 22 : 25),
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 4 : 8),
          Text(
            'Lorem Ipsum is simply dummy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: isMobile ? 12 : (isTablet ? 14 : 18),
              fontFamily: 'Inter',
            ),
            maxLines: 2,
          ),
          if (!isMobile) SizedBox(height: 8),
          CustomOutlinedButton(
            text: 'Discover More',
            onPressed: () {},
            isSmall: isMobile,
          ),
        ],
      ),
    ),
  );
}
