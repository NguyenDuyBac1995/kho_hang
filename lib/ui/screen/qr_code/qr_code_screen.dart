import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gap/gap.dart';
import 'package:kho_hang/ui/screen/widget/component/app_bar.dart';
import 'package:kho_hang/ui/screen/widget/utils/assets.dart';
import 'package:kho_hang/ui/screen/widget/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  void initState() {
    super.initState();
    scanBarcodeNormal();
  }

  Future<void> scanBarcodeNormal()async {
    String barcodeScanRes;
    try{
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666",
          "Thoát",
          true,
          ScanMode.BARCODE
      );
      debugPrint(barcodeScanRes);
    }on PlatformException{
      barcodeScanRes = "Failed to get platform version.";
    }
    if (!mounted) return;
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  String _scanBarcodeResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context,title: "Quét mã Pallet", assetsIcon: ImagePath.qrCodeIcon),
      body: Builder(
        builder: (context)=>
            Container(
          alignment: Alignment.center,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: scanBarcodeNormal,
                  child: Text("Quét mã", style: AppStyle.textBold(12.sp),)),
            Gap(2.h),
            Text(" Ma quet $_scanBarcodeResult")
            ],
          ),
        ),
      ),
    );
  }

}
