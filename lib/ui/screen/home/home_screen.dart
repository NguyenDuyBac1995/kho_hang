import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kho_hang/ui/router/router_generator.dart';
import 'package:kho_hang/ui/screen/widget/utils/assets.dart';
import 'package:kho_hang/ui/screen/widget/utils/colors.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemHome> listItem = [
    ItemHome(ImagePath.importIcon, "NHẬP HÀNG", AppRouter.routeImport),
    ItemHome(ImagePath.exportIcon, "XUẤT HÀNG", AppRouter.routeExport),
    ItemHome(ImagePath.transferIcon, "CẮT CHUYỂN", AppRouter.routeConvert),
    ItemHome(ImagePath.qrCodeIcon, "KIỂM TRA MÃ CÂN",""),
    ItemHome(ImagePath.dropDownIcon, "KIỂM TRA PALLET", ""),
    ItemHome(ImagePath.rackIcon, "KIỂM TRA VỊ TRÍ", ""),
    ItemHome(ImagePath.searchIcon, "TRUY VẤN PALLET", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(6.5.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("DANH SÁCH ỨNG DỤNG",
            style: AppStyle.textBold(18.sp),
          ),
          backgroundColor: AppColor.blue,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.w),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: listItem.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2.w,
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                childAspectRatio: 1.2),
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, listItem[index].router!);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Image.asset( listItem[index].assetsIcon!,height: 13.h,fit: BoxFit.fitHeight),
                      Gap(0.5.h),
                      Text(listItem[index].title!, style: AppStyle.textDarkMedium(12.sp),)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ItemHome{
  String? assetsIcon;
  String? title;
  String? router;
  ItemHome(this.assetsIcon, this.title, this.router);
}