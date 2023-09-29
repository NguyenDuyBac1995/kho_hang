import 'package:flutter/material.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class WidgetNotFound extends StatelessWidget {
  const WidgetNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("404", style: AppStyle.textBold(12.sp),),),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}
