import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kho_hang/ui/router/router_generator.dart';
import 'package:kho_hang/ui/screen/convert/bloc/convert_bloc.dart';
import 'package:kho_hang/ui/screen/export/bloc/export_bloc.dart';
import 'package:kho_hang/ui/screen/login/bloc/login_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginBloc()),
          BlocProvider(create: (_) => ExportBloc()..add(GetExportEvent())),
          BlocProvider(create: (_) => ConvertBloc()..add(GetConvertEvent())),
        ],
        child: Sizer(builder: (BuildContext context, orientation, deviceType){
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRouter,
            initialRoute: AppRouter.routeLogin,
          );
        }),
    );
  }
}
