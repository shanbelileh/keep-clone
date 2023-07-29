import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keep/app_bindings.dart';
import 'package:keep/screens/home/home_screen.dart';
import 'package:keep/theme/app_theme.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey[100],
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      initialBinding: AppBindings(),
      defaultTransition: Transition.fade,
      theme: AppTheme.basic,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      )
      ,
      home: const HomeScreen(),
    );
  }
}
