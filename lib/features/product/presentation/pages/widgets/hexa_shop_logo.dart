import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class HexashopLogo extends StatelessWidget {
  final double size;
  final Color textClr;
  final Color logoClr;
  final Color companyNameClr;
  final Color companyCategryClr;
  final bool isSmall; // For responsive sizing

  const HexashopLogo({
    super.key,
    this.size = 60.0,
    required this.textClr,
    required this.logoClr,
    required this.companyNameClr,
    required this.companyCategryClr,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1024;

    // Determine actual sizing
    final bool smallMode = isSmall || isMobile;
    final bool tabletMode = isTablet && !isMobile;

    final double logoSize = smallMode ? 40.0 : (tabletMode ? 50.0 : size);
    final double fontSize = smallMode ? 20.0 : (tabletMode ? 24.0 : 28.0);
    final double companyNameSize = smallMode
        ? 14.0
        : (tabletMode ? 16.0 : 18.0);
    final double companyCategorySize = smallMode
        ? 9.0
        : (tabletMode ? 10.0 : 11.0);
    final double spacing = smallMode ? 4.0 : (tabletMode ? 6.0 : 8.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: logoSize,
          height: logoSize,
          child: CustomPaint(
            painter: HexagonPainter(logoClr: logoClr),
            child: Center(
              child: Text(
                'H',
                style: GoogleFonts.inter(
                  color: textClr,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: spacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'HEXASHOP',
              style: GoogleFonts.inter(
                fontSize: companyNameSize,
                fontWeight: FontWeight.w700,
                color: companyNameClr,
              ),
            ),
            SizedBox(height: smallMode ? 1.0 : 2.0),
            Text(
              'ONLINE SHOPPING',
              style: GoogleFonts.inter(
                fontSize: companyCategorySize,
                color: companyCategryClr,
                letterSpacing: smallMode ? 0.5 : 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Responsive HexagonPainter (optional - can adjust stroke width if needed)
class HexagonPainter extends CustomPainter {
  final Color logoClr;
  final double strokeWidth;

  HexagonPainter({
    super.repaint,
    required this.logoClr,
    this.strokeWidth = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = logoClr
      ..style = PaintingStyle.fill;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 6; i++) {
      final angle = (math.pi / 3 * i) - (math.pi / 6);
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);

    // Optional: Add stroke/border if needed
    if (strokeWidth > 0) {
      final borderPaint = Paint()
        ..color = logoClr.withOpacity(0.8)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Alternative: Factory method for different screen sizes
class ResponsiveHexashopLogo {
  static Widget small({
    required Color textClr,
    required Color logoClr,
    required Color companyNameClr,
    required Color companyCategryClr,
  }) {
    return HexashopLogo(
      size: 40.0,
      textClr: textClr,
      logoClr: logoClr,
      companyNameClr: companyNameClr,
      companyCategryClr: companyCategryClr,
      isSmall: true,
    );
  }

  static Widget medium({
    required Color textClr,
    required Color logoClr,
    required Color companyNameClr,
    required Color companyCategryClr,
  }) {
    return HexashopLogo(
      size: 50.0,
      textClr: textClr,
      logoClr: logoClr,
      companyNameClr: companyNameClr,
      companyCategryClr: companyCategryClr,
    );
  }

  static Widget large({
    required Color textClr,
    required Color logoClr,
    required Color companyNameClr,
    required Color companyCategryClr,
  }) {
    return HexashopLogo(
      size: 60.0,
      textClr: textClr,
      logoClr: logoClr,
      companyNameClr: companyNameClr,
      companyCategryClr: companyCategryClr,
    );
  }

  // Auto-detect size based on context
  static Widget auto({
    required BuildContext context,
    required Color textClr,
    required Color logoClr,
    required Color companyNameClr,
    required Color companyCategryClr,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width < 768) {
      return small(
        textClr: textClr,
        logoClr: logoClr,
        companyNameClr: companyNameClr,
        companyCategryClr: companyCategryClr,
      );
    } else if (width < 1024) {
      return medium(
        textClr: textClr,
        logoClr: logoClr,
        companyNameClr: companyNameClr,
        companyCategryClr: companyCategryClr,
      );
    } else {
      return large(
        textClr: textClr,
        logoClr: logoClr,
        companyNameClr: companyNameClr,
        companyCategryClr: companyCategryClr,
      );
    }
  }
}
