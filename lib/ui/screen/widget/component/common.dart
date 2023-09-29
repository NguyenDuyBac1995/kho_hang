import 'package:flutter/material.dart';
import 'package:kho_hang/ui/screen/widget/utils/colors.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class Common{
  Widget buttonCommon({
    String? text,
    VoidCallback? callBack,
    Color colors = AppColor.blue,
    Color colorBorder = AppColor.blue,
    double border = 15
  }) {
    return GestureDetector(
      child: Container(
        height: 6.5.h,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(border),
            border: Border.all(color: colorBorder, width: 0.8)
        ),
        child: Center(
          child: Text(
            text??"",
            style: AppStyle.textBold(16.sp),
          ),
        ),
      ),
      onTap: () {
        callBack!();
      },
    );
  }
}