

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kho_hang/data/network/api_constants.dart';

import '../model/export_model.dart';

Future<ExportModel> getExportItem () async{
  final reps = await Dio().get(ApiConstants.getExport);
  if(reps.statusCode == 200 ){
     ExportModel result =  ExportModel.fromJson(reps.data);
     debugPrint(" Data : ${result.data}");
     return result;
  }
  else {
    throw Exception("Lỗi data");
  }
}