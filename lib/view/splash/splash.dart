import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _State();
}

class _State extends State<Splash> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return const Scaffold(
        body: Center(child: FlutterLogo(size: 200)),
      );
    });
  }
}
