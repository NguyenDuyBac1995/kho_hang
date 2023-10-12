import 'package:flutter/material.dart';
import 'package:kho_hang/ui/screen/widget/utils/assets.dart';
import 'package:kho_hang/ui/screen/widget/utils/colors.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

PreferredSize appBarWidget (BuildContext context ,{String? title,VoidCallback? onTap, required String assetsIcon }) {
  return PreferredSize(
    preferredSize:Size.fromHeight(6.5.h),
    child: AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 17.w,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: Image.asset(assetsIcon,fit: BoxFit.fitWidth,),
      ),
      title: Text(
        title ?? '',
        style: AppStyle.textBold(18.sp),
      ),
      elevation: 0,
      backgroundColor: AppColor.blue,
      actions: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 1.5.w, 5.w, 1.5.w),
          width: 15.w,
          child: GestureDetector(
              onTap: (){
            Navigator.pop(context);},
              child: Image.asset(
                ImagePath.backIcon, fit: BoxFit.fitHeight,
          )),
        )
      ],
    ),
  );
}