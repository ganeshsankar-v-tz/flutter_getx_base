import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_base/utils/local_data.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
  );

  ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  );

  bool isDarkMode = LocalData().box.read("app_theme") ?? true;

  updateThemeStatus(bool value) async {
    Get.changeTheme(value ? AppTheme().lightTheme : AppTheme().darkTheme);
    LocalData().box.write("app_theme", value);
  }
}
