import 'package:flutter/material.dart';
import 'package:kho_hang/ui/router/404.dart';
import 'package:kho_hang/ui/screen/convert/convert_screen.dart';
import 'package:kho_hang/ui/screen/export/export_screen.dart';
import 'package:kho_hang/ui/screen/home/home_screen.dart';
import 'package:kho_hang/ui/screen/import/import_screen.dart';
import 'package:kho_hang/ui/screen/login/login_screen.dart';

class AppRouter{
 //* Routing List
  static const routeHome = "/home";
  static const routeLogin = "/login";
  static const routeImport = "/import";
  static const routeExport = "/export";
  static const routeConvert = "/convert";

  static Route<dynamic> generateRouter (RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case routeHome:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case routeImport:
        return MaterialPageRoute(builder: (_)=> const ImportScreen());
      case routeExport:
        return MaterialPageRoute(builder: (_)=> const ExportScreen());
      case routeConvert:
        return MaterialPageRoute(builder: (_)=> const ConvertScreen());
      default:
        break;
    }
    return MaterialPageRoute(builder: (_)=> const WidgetNotFound());
  }
}