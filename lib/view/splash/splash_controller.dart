import 'package:get/get.dart';

import '../home/home.dart';
import '../login/login.dart';


class SplashController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    splashDuration();
  }

  void splashDuration() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAndToNamed(Login.routeName);
    });
  }
}
