import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarcred_test/core/responsive/responsive.dart';

Widget menuItem(String title, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  double horizontalPadding;
  double fontSize;

  if (width < ResponsiveConstants.tabletBreakpoint) {
    horizontalPadding = 10.0;
    fontSize = 16.0;
  } else if (width < ResponsiveConstants.desktopBreakpoint) {
    horizontalPadding = 20.0;
    fontSize = 18.0;
  } else {
    horizontalPadding = 40.0;
    fontSize = 21.0;
  }

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: width < ResponsiveConstants.tabletBreakpoint
            ? FontWeight.w500
            : FontWeight.normal,
      ),
    ),
  );
}
