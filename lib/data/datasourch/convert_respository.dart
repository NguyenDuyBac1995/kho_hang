

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kho_hang/data/model/convert_model.dart';
import 'package:kho_hang/data/network/api_constants.dart';



Future<ConvertModel> getConvertItem () async{
  final reps = await Dio().get(ApiConstants.getConvert);
  if(reps.statusCode == 200 ){
    ConvertModel result =  ConvertModel.fromJson(reps.data);
    debugPrint(" Data : ${result.data}");
    return result;
  }
  else {
    throw Exception("Lỗi data");
  }
}