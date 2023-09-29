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
      leadingWidth: 100,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Image.asset(assetsIcon,fit: BoxFit.fitHeight,),
      ),
      title: Text(
        title ?? '',
        style: AppStyle.textBold(18.sp),
      ),
      elevation: 0,
      backgroundColor: AppColor.blue,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 6.w),
          child: IconButton(
              onPressed: (){
            Navigator.pop(context);},
              icon: Image.asset(
                ImagePath.backIcon, fit: BoxFit.fitHeight,
          )),
        )
      ],
    ),
  );
}