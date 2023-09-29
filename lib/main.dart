import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kho_hang/ui/router/router_generator.dart';
import 'package:kho_hang/ui/screen/login/bloc/login_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginBloc()),
        ],
        child: Sizer(builder: (BuildContext context, orientation, deviceType){
          return const MaterialApp(
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRouter,
            initialRoute: AppRouter.routeLogin,
          );
        }),
    );
  }
}
