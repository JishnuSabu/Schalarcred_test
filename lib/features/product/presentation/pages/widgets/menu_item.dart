import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget menuItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Text(title, style: GoogleFonts.inter(fontSize: 21)),
  );
}
