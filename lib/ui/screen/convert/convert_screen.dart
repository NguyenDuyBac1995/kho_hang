import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kho_hang/data/model/convert_model.dart';
import 'package:kho_hang/ui/screen/convert/bloc/convert_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../data/enums/enums.dart';
import '../import/import_screen.dart';
import '../widget/component/app_bar.dart';
import '../widget/component/loading_indicator.dart';
import '../widget/utils/assets.dart';
import '../widget/utils/colors.dart';
import '../widget/utils/text_styles.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  final TextEditingController massController = TextEditingController();
  final TextEditingController palletController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController orderController = TextEditingController();

  List<Item> listItem = [
    Item("8500", "8000HPC_014", "29.9340", "20151278921"),
    Item("8500", "8000HPC_014", "29.9340", "20151278921"),
    Item("8500", "8000HPC_014", "29.9340", "20151278921"),
    Item("8500", "8000HPC_014", "29.9340", "20151278921"),
    Item("8500", "8000HPC_014", "29.9340", "20151278921")
  ];
  bool checkValue = false;
  int? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context, title: "NHẬP HÀNG", assetsIcon: ImagePath.transferIcon),
      body: BlocBuilder<ConvertBloc, ConvertState>(
        builder: (context, state){
          switch (state.status){
            case RequestStatus.error:
              return Center(
                child: Text(state.message),
              );
            case RequestStatus.loading :
              return const LoadingIndicator();
            case RequestStatus.loaded :
              ConvertModel exportValue = state.convertData!;
              return Column(
                children: [
                  Gap(0.2.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                    color: AppColor.blueLight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("MÃ CÂN: 4", style: AppStyle.textBold(13.sp),),
                        Row(children: [
                          Container(
                            width: 2.2.h,
                            height: 2.2.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.background,
                                borderRadius: BorderRadius.circular(5)),
                            child: Checkbox(
                                side: const BorderSide(color: Colors.transparent),
                                activeColor: AppColor.background,
                                checkColor: Colors.white,
                                value: checkValue,
                                onChanged: (value){
                                  setState(() {
                                    checkValue = value!;
                                  });
                                }),
                          ),
                          Gap(2.w),
                          Text("MÃ CÂN TAY" , style: AppStyle.textBold(13.sp),),
                          Icon(Icons.keyboard_double_arrow_right, size: 20.sp,color: Colors.white,)
                        ],),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        Gap(1.h),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Đơn hàng:", style: AppStyle.textDarkMedium(12.sp),)),
                            Expanded(flex: 3, child: textField(title: "8560", controller: orderController) ,)
                          ],
                        ),
                        Gap(1.h),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Tên Pallet:", style: AppStyle.textDarkMedium(12.sp),)),
                            Expanded(flex: 3, child: Row(
                              children: [
                                Expanded(child: textField(title: "8000HPC_014", controller: palletController)),
                                Gap(0.5.w),
                                GestureDetector(
                                    onTap: ()=>
                                        PopupMenuButton(itemBuilder: (context)=>[
                                          const PopupMenuItem(child: Text("xoa")),
                                        ],
                                        ),
                                    child: Image.asset(ImagePath.saveIcon, width: 4.5.h,fit: BoxFit.cover,))
                              ],
                            ) ,),
                          ],
                        ),
                        Gap(1.h),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Barcode:", style: AppStyle.textDarkMedium(12.sp),)),
                            Expanded(flex: 3, child: textField(title: "20121239761", controller: barcodeController) ,)
                          ],
                        ),
                        Gap(1.h),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Khối lượng:", style: AppStyle.textDarkMedium(12.sp),)),
                            Expanded(flex: 3, child: textField(title: "28.58", controller: massController) ,)
                          ],
                        ),
                        Gap(2.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: SizedBox(
                            width: 500,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: exportValue.data!.length,
                              itemBuilder:(BuildContext context ,int index){
                                if (index == 0){
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 3),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        border: Border(bottom: BorderSide(color: AppColor.black, width: 0.4))
                                    ),
                                    height: 4.5.h,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 30,child: Center(child: Text("STT", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text("Đơn hàng", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text("Tên pallet", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text("Khối lượng", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text("Số lượng", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text("Tình trạng", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 60,child: Center(child: Text("Barcode", style: AppStyle.textDarkMedium(8.5.sp),)),),
                                      ],
                                    ),
                                  );
                                }
                                return GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                                    decoration:  BoxDecoration(
                                        color: selectedColor == index ?AppColor.blueDark:Colors.transparent,
                                        border: const Border(bottom: BorderSide(color: AppColor.black, width: 0.4))
                                    ),
                                    height: 4.5.h,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 30,child: Center(child: Text(index.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text(exportValue.data![index].maSanPham.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text(exportValue.data![index].tenPlt.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text(exportValue.data![index].khoiLuong.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text(exportValue.data![index].slXuat.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 80,child: Center(child: Text(exportValue.data![index].trangThai.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                        SizedBox(width: 60,child: Center(child: Text(exportValue.data![index].idObt.toString(), style: AppStyle.textDarkMedium(8.5.sp),)),),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
          }
        },
      ),
      bottomSheet: SizedBox(
        height: 8.h,
        child: Column(
          children: [
            Container(
              color: AppColor.background.withOpacity(0.5),
              height: 3.5.h,
              width: 100.w,
              child: Row(
                children: [
                  Container(
                    width: 7.w,
                    color: AppColor.background,
                    child: Center(child: Icon(Icons.arrow_left, size: 25.sp,color: Colors.black,)),
                  ),
                  Expanded(child:
                  Container(
                    color: AppColor.white,
                    width: 86.w,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 30.w,
                          height: 3.5.h,
                          color: AppColor.greyLight,
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: 7.w,
                    color: AppColor.background,
                    child: Center(child: Icon(Icons.arrow_right, size: 25.sp,color: Colors.black,)),
                  )
                ],
              ),
            ),
            Gap(1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" SL TT:1 / SLYC: 35", style: AppStyle.textDarkMedium(12.sp),),
                Text("KLTT: 23.5 / KLTB: 1350 ", style: AppStyle.textDarkMedium(12.sp))
              ],
            )
          ],
        ),
      ),
    );
  }
}
