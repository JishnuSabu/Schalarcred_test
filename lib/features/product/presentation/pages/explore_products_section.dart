import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/images_path/images.dart';
import 'package:scholarcred_test/core/responsive/responsive.dart';

class ExploreProductsSection extends StatelessWidget {
  const ExploreProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;
    final isTablet = width < ResponsiveConstants.desktopBreakpoint && !isMobile;

    return Container(
      color: Color(0xFFFFFFFF),
      height: ResponsiveConstants.getExploreSectionHeight(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveConstants.getHorizontalPadding(context),
          vertical: isMobile ? 20 : 0,
        ),
        child: Center(
          child: isMobile
              ? _buildMobileLayout(context)
              : isTablet
              ? _buildTabletLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _buildTextContent(context)),
        const SizedBox(width: 60),
        Expanded(flex: 5, child: _buildImageGrid(context)),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextContent(context),
        const SizedBox(height: 40),
        _buildImageGrid(context),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextContent(context),
          const SizedBox(height: 40),
          _buildImageGrid(context),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;
    final titleFontSize = ResponsiveConstants.getTitleFontSize(context);
    final bodyFontSize = ResponsiveConstants.getBodyFontSize(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'Explore Our Products',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Color(0xFF000000),
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(
              fontSize: bodyFontSize,
              color: Color(0xFF000000),
              fontFamily: 'Inter',
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 15),
          Text(
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(
              fontSize: bodyFontSize,
              color: Color(0xFF000000),
              fontFamily: 'Inter',
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;
    final height = isMobile
        ? 200.0
        : (width < ResponsiveConstants.desktopBreakpoint ? 300.0 : 449.0);

    if (isMobile) {
      return Column(
        children: [
          _buildImageCard(
            'Leather Bags',
            'Lorem Ipsum is simply dummy text',
            Images.bag,
            height: height,
            context: context,
          ),
          const SizedBox(height: 10),
          _buildImageCard(
            '',
            '',
            Images.bangles,
            height: height,
            hideOverlay: true,
            context: context,
          ),
          const SizedBox(height: 10),
          _buildImageCard(
            '',
            '',
            Images.girlwithbag,
            height: height,
            hideOverlay: true,
            context: context,
          ),
          const SizedBox(height: 10),
          _buildImageCard(
            'Different Types',
            'Lorem Ipsum is simply dummy text',
            Images.jeans,
            height: height,
            context: context,
          ),
        ],
      );
    } else {
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
                  height: height,
                  context: context,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildImageCard(
                  '',
                  '',
                  Images.bangles,
                  height: height,
                  hideOverlay: true,
                  context: context,
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
                  height: height,
                  hideOverlay: true,
                  context: context,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildImageCard(
                  'Different Types',
                  'Lorem Ipsum is simply dummy text',
                  Images.jeans,
                  height: height,
                  context: context,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildImageCard(
    String title,
    String subtitle,
    String imageUrl, {
    required double height,
    bool hideOverlay = false,
    required BuildContext context,
  }) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;

    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: hideOverlay
          ? const SizedBox.shrink()
          : Container(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isMobile ? 24 : 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isMobile ? 12 : 14,
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
