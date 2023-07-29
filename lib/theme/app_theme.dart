import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
class AppTheme {
  static ThemeData get basic => ThemeData(
      splashFactory: InkRipple.splashFactory,
      brightness: Brightness.light,
      primarySwatch: Colors.deepOrange,
      // useMaterial3: true,
      fontFamily: "Sans",
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      )
  );


}
