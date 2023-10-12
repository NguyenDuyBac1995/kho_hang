import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kho_hang/ui/screen/widget/component/app_bar.dart';
import 'package:kho_hang/ui/screen/widget/utils/assets.dart';
import 'package:kho_hang/ui/screen/widget/utils/colors.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_field_styles.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
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
      appBar: appBarWidget(context, title: "NHẬP HÀNG", assetsIcon: ImagePath.importIcon, ),
      body: Column(
        children: [
          Gap(0.2.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.5.h),
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
                    Expanded(flex: 3, child: textField(title: "8000HPC_014", controller: palletController) ,),
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listItem.length,
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
                              Expanded(flex: 1,child: Text("STT", style: AppStyle.textDarkMedium(8.5.sp),),),
                              Expanded(flex: 2,child: Text("Đơn hàng", style: AppStyle.textDarkMedium(8.5.sp),),),
                              Expanded(flex: 3,child: Text("Tên pallet", style: AppStyle.textDarkMedium(8.5.sp),),),
                              Expanded(flex: 2,child: Text("Khối lượng", style: AppStyle.textDarkMedium(8.5.sp),),),
                              Expanded(flex: 3,child: Text("Barcode", style: AppStyle.textDarkMedium(8.5.sp),),),
                            ],
                          ),
                        );
                      }
                       return GestureDetector(
                         onTap: (){
                           setState(() {
                             selectedColor = index;
                           });
                         },
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 1.w),
                           decoration:  BoxDecoration(
                             color: selectedColor == index ?AppColor.blueDark:Colors.transparent,
                               border: const Border(bottom: BorderSide(color: AppColor.black, width: 0.4))
                           ),
                           height: 4.5.h,
                           child: Row(
                             children: [
                               Expanded(flex: 1,child: Text(index.toString(), style: AppStyle.textDarkMedium(8.5.sp),),),
                               Expanded(flex: 2,child: Text(listItem[index].order!, style: AppStyle.textDarkMedium(8.5.sp),),),
                               Expanded(flex: 3,child: Text(listItem[index].pallet!, style: AppStyle.textDarkMedium(8.5.sp),),),
                               Expanded(flex: 2,child: Text(listItem[index].mass!, style: AppStyle.textDarkMedium(8.5.sp),),),
                               Expanded(flex: 3,child: Text(listItem[index].barcode!, style: AppStyle.textDarkMedium(8.5.sp),),),
                             ],
                           ),
                         ),
                       );
                    },
                )
              ],
            ),
          )
        ],
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
Widget textField({String? title, TextEditingController? controller }){
  return SizedBox(
    height: 4.2.h,
    child: TextFormField(
      style: AppStyle.textDarkMedium(13.sp),
      controller: controller,
      decoration: AppTextField.inputDecorationBorder(
          paddingSizeHorizotal: 10,
          borderColor: Colors.grey,
          paddingSize: 0,
          hintText: title,
          hintColor: AppColor.black,
          borderRadius: 0,
          hintSize: 13.sp
      ),
    ),
  );
}

class Item{
  String? order;
  String? pallet;
  String? mass;
  String? barcode;
  Item(this.order, this.pallet, this.mass, this.barcode);
}