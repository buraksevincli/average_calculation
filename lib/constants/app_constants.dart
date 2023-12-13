import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
  static const MaterialColor mainColor = Colors.indigo;
  static const String appHeaderText = "Average Calculate";
  static final TextStyle appHeaderStyle = GoogleFonts.quicksand(
    fontSize: 24, fontWeight: FontWeight.w900, color: mainColor
  );
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static final TextStyle showAverageTextStyle = GoogleFonts.quicksand(
    fontSize: 16, fontWeight: FontWeight.w600, color: mainColor
  );
  static final TextStyle averageTextStyle = GoogleFonts.quicksand(
    fontSize: 55, fontWeight: FontWeight.w800, color: mainColor
  );
  static const EdgeInsets dropdownPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 8);
}