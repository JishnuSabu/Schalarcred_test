import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/responsive/responsive.dart';
import 'package:scholarcred_test/features/product/domain/entities/product.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/product_card.dart';

class ProductListSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Product> products;

  const ProductListSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = ResponsiveConstants.getHorizontalPadding(context);
    final titleFontSize = ResponsiveConstants.getTitleFontSize(context);
    final bodyFontSize = ResponsiveConstants.getBodyFontSize(context);
    final cardHeight = ResponsiveConstants.getProductCardHeight(context);
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 0 : 8),
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                    fontFamily: 'Inter',
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: bodyFontSize,
                    color: Color(0xFF000000),
                    fontFamily: 'Inter',
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: cardHeight,
            child: isMobile
                ? _buildMobileProductList(context)
                : _buildDesktopProductList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopProductList(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }

  Widget _buildMobileProductList(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 3;

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index], isSmall: true);
      },
    );
  }
}
