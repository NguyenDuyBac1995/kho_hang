import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kho_hang/ui/screen/widget/utils/colors.dart';

class AppStyle{
  static TextStyle textBold(double fontSize) => getTextStyle(fontSize: fontSize, color: Colors.white);
  static TextStyle textMedium(double fontSize) => getTextStyle(fontSize: fontSize, color: Colors.white, fontWeight: FontWeight.w400);
  static TextStyle textDarkBold(double fontSize) => getTextStyle(fontSize: fontSize, color: Colors.black);
  static TextStyle textDarkMedium(double fontSize) => getTextStyle(fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.w400);
}

TextStyle getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w700,
  required Color color,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
