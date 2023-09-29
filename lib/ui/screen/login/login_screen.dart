import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kho_hang/ui/router/router_generator.dart';
import 'package:kho_hang/ui/screen/widget/utils/assets.dart';
import 'package:kho_hang/ui/screen/widget/utils/colors.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

import '../widget/component/common.dart';
import '../widget/utils/text_field_styles.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textUsernameController = TextEditingController();
  final textPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  bool invisible = true;
  bool checkPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 100.h,
        child: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.LOGO,
                    fit: BoxFit.fitHeight,
                    height: 15.h,
                  ),
                  Gap(2.h),
                  Text(
                    "Đăng Nhập".toUpperCase(),
                    style:
                        AppStyle.textBold(22.sp).copyWith(color: AppColor.blue),
                  ),
                  Gap(2.h),
                  TextFormField(
                    style: AppStyle.textDarkMedium(12.sp),
                    controller: textUsernameController,
                    onChanged: (String value) {
                      username = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username không  hợp lệ";
                      }
                      return null;
                    },
                    decoration: AppTextField.inputDecorationBorder(
                      fillColor: Colors.white,
                      hintText: 'Tên đăng nhập',
                      paddingSize: 22,
                    ),
                  ),
                  Gap(2.h),
                  TextFormField(
                    style: AppStyle.textDarkMedium(12.sp),
                    controller: textPasswordController,
                    obscureText: invisible,
                    onChanged: (String value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mật khẩu không hợp lệ";
                      }
                      return null;
                    },
                    decoration: AppTextField.inputDecorationBorder(
                        fillColor: Colors.white,
                        hintText: 'Mật khẩu',
                        paddingSize: 22,
                        suffixIcon: IconButton(
                          icon: Icon(invisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              invisible = !invisible;
                            });
                            // context
                            //     .read<LoginBloc>()
                            //     .add(TogglePasswordStatusChanged());
                          },
                        )),
                  ),
                  Gap(1.h),
                  Row(children: [
                    Checkbox(
                      activeColor: AppColor.blue,
                      checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(color: AppColor.background)),
                        value: checkPassword,
                        onChanged: (value){
                          setState(() {
                            checkPassword = value!;
                          });
                    }),
                    Text(" Lưu mật khẩu" , style: AppStyle.textDarkMedium(12.sp),),
                  ],),
                  Gap(1.h),
                  Common().buttonCommon(text: 'Đăng nhập'.toUpperCase(), callBack: () {
                    Navigator.pushNamed(context, AppRouter.routeHome);
                  }),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
