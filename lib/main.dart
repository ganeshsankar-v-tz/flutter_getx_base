import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_flutter_base/utils/local_data.dart';

import 'language/app_locale_constant.dart';
import 'language/translation_service.dart';
import 'network/network_binding.dart';
import 'router.dart';
import 'utils/app_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  NetworkBinding.init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    isDarkMode = LocalData().box.read("app_theme") ?? true;
    super.initState();
  }

  Locale? locale;

  @override
  void didChangeDependencies() {
    getLocale().then((Locale getLocale) {
      setState(() {
        locale = getLocale;
      });
    });
    //initialTheme();
    super.didChangeDependencies();
  }

  Locale setLocale() {
    return locale ?? Get.deviceLocale!;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      themeMode: ThemeMode.light,
      theme: isDarkMode ? AppTheme().lightTheme : AppTheme().darkTheme,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: TranslationService().keys,
      defaultTransition: Transition.fade,
      initialRoute: '/',
      getPages: AppRouter.routes,
    );
  }
}
