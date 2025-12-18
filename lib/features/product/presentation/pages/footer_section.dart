import 'package:flutter/material.dart';
import 'package:scholarcred_test/core/responsive/responsive.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_logo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;
    final isTablet = width < ResponsiveConstants.desktopBreakpoint && !isMobile;

    return Column(
      children: [
        Container(
          height: isMobile ? 400 : 286,
          color: Color(0xFF1E1E1E),
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveConstants.getHorizontalPadding(context),
            vertical: isMobile ? 20 : 50,
          ),
          child: isMobile
              ? _buildMobileFooter(context)
              : isTablet
              ? _buildTabletFooter(context)
              : _buildDesktopFooter(context),
        ),
        Container(
          color: Color(0xFF000000),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              'Copyright @ 2022',
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'Inter',
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildCompanyInfo(context)),
        const SizedBox(width: 60),
        Expanded(
          child: _buildLinkSection('Shopping and Categories', [
            'Men\'s Shopping',
            'Women\'s Shopping',
            'Kid\'s Shopping',
          ], context),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: _buildLinkSection('Useful Links', [
            'Homepage',
            'About Us',
            'Help',
            'Contact Us',
          ], context),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: _buildLinkSection('Help & Information', [
            'FAQ\'S',
            'Shipping',
            'Tracking Id',
          ], context),
        ),
      ],
    );
  }

  Widget _buildTabletFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildCompanyInfo(context)),
            const SizedBox(width: 40),
            Expanded(
              child: _buildLinkSection('Shopping and Categories', [
                'Men\'s Shopping',
                'Women\'s Shopping',
                'Kid\'s Shopping',
              ], context),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLinkSection('Useful Links', [
                'Homepage',
                'About Us',
                'Help',
                'Contact Us',
              ], context),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: _buildLinkSection('Help & Information', [
                'FAQ\'S',
                'Shipping',
                'Tracking Id',
              ], context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCompanyInfo(context),
          const SizedBox(height: 30),
          _buildLinkSection('Shopping and Categories', [
            'Men\'s Shopping',
            'Women\'s Shopping',
            'Kid\'s Shopping',
          ], context),
          const SizedBox(height: 30),
          _buildLinkSection('Useful Links', [
            'Homepage',
            'About Us',
            'Help',
            'Contact Us',
          ], context),
          const SizedBox(height: 30),
          _buildLinkSection('Help & Information', [
            'FAQ\'S',
            'Shipping',
            'Tracking Id',
          ], context),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HexashopLogo(
          textClr: Color(0xFF000000),
          logoClr: Color(0xFFFFFFFF),
          companyNameClr: Color(0xFFFFFFFF),
          companyCategryClr: Color(0xFFFFFFFF),
          isSmall: isMobile,
        ),
        SizedBox(height: isMobile ? 15 : 30),
        _buildInfoRow('Address:', 'Lahore Road, Sheikhupura', context),
        const SizedBox(height: 8),
        _buildInfoRow('E-mail:', 'Example@gmail.com', context),
        const SizedBox(height: 8),
        _buildInfoRow('Phone:', '0092 356 3656210', context),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: isMobile ? 12 : 14,
          fontFamily: 'Inter',
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: '$label ',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }

  Widget _buildLinkSection(
    String title,
    List<String> links,
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < ResponsiveConstants.tabletBreakpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 15),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              link,
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                fontFamily: 'Inter',
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
