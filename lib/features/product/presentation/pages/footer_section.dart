import 'package:flutter/material.dart';
import 'package:scholarcred_test/features/product/presentation/pages/widgets/hexa_shop_logo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 286,
          color: Color(0xFF1E1E1E),
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _buildCompanyInfo()),
              const SizedBox(width: 60),
              Expanded(
                child: _buildLinkSection('Shopping and Categories', [
                  'Men\'s Shopping',
                  'Women\'s Shopping',
                  'Kid\'s Shopping',
                ]),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: _buildLinkSection('Useful Links', [
                  'Homepage',
                  'About Us',
                  'Help',
                  'Contact Us',
                ]),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: _buildLinkSection('Help & Information', [
                  'FAQ\'S',
                  'Shipping',
                  'Tracking Id',
                ]),
              ),
            ],
          ),
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

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HexashopLogo(
          textClr: Color(0xFF000000),
          logoClr: Color(0xFFFFFFFF),
          companyNameClr: Color(0xFFFFFFFF),
          companyCategryClr: Color(0xFFFFFFFF),
        ),
        const SizedBox(height: 30),
        _buildInfoRow('Address:', 'Lahore Road, Sheikhupura'),
        const SizedBox(height: 12),
        _buildInfoRow('E-mail:', 'Example@gmail.com'),
        const SizedBox(height: 12),
        _buildInfoRow('Phone:', '0092 356 3656210'),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14,
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

  Widget _buildLinkSection(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              link,
              style: TextStyle(
                fontSize: 14,
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
