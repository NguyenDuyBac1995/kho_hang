import 'package:flutter/material.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'colors.dart';
import 'package:sizer/sizer.dart';

class AppTextField {
  static InputDecoration inputDecorationBorder({
    String? errorText,
    String? hintText,
    Color hintColor = AppColor.blue,
    Widget? label,
    String? labelText,
    Widget? suffixIcon,
    Widget? suffix,
    String? suffixText,
    Widget? prefix,
    String? prefixText,
    Widget? prefixIcon,
    TextStyle? prefixStyle,
    Color fillColor = Colors.white,
    Color borderColor = AppColor.blue,
    double paddingSize = 16,
    double paddingSizeHorizotal = 20,
    double hintSize =15,
    double borderRadius = 14,
  }) {
    return InputDecoration(
      errorText: errorText,
      errorStyle: AppStyle.textMedium(13.sp).copyWith(color: Colors.red),
      fillColor: fillColor,
      filled: true,
      suffixIconColor: borderColor,
      prefixIconColor: borderColor,
      iconColor: borderColor,
      suffixIcon: suffixIcon,
      suffix:suffix,
      suffixText:suffixText,
      prefix:prefix,
      prefixIcon:prefixIcon,
      hintText: hintText,
      hintStyle: TextStyle(color: hintColor, fontSize: hintSize, wordSpacing: 1.0),
      contentPadding: EdgeInsets.symmetric(vertical: paddingSize, horizontal: paddingSizeHorizotal),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor), // No border
        borderRadius: BorderRadius.circular(borderRadius), // Apply corner radius
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor), // No border
        borderRadius: BorderRadius.circular(borderRadius), // Apply corner radius
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, style: BorderStyle.solid, color: Colors.red), // No border
        borderRadius: BorderRadius.circular(borderRadius), // Apply corner radius
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, style: BorderStyle.solid, color: Colors.red), // No border
        borderRadius: BorderRadius.circular(borderRadius), // Apply corner radius
      ),
    );
  }
}
