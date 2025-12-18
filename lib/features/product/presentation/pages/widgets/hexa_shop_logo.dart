import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class HexashopLogo extends StatelessWidget {
  final double size;
  final Color textClr;
  final Color logoClr;
  final Color companyNameClr;
  final Color companyCategryClr;

  const HexashopLogo({
    super.key,
    this.size = 60.0,
    required this.textClr,
    required this.logoClr,
    required this.companyNameClr,
    required this.companyCategryClr,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: HexagonPainter(logoClr: logoClr),
            child: Center(
              child: Text(
                'H',
                style: GoogleFonts.inter(
                  color: textClr,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEXASHOP',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: companyNameClr,
              ),
            ),
            Text(
              'ONLINE SHOPPING',
              style: GoogleFonts.inter(fontSize: 11, color: companyCategryClr),
            ),
          ],
        ),
      ],
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color logoClr;

  HexagonPainter({super.repaint, required this.logoClr});
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
