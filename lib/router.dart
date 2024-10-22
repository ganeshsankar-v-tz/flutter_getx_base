import 'package:get/get.dart';

import 'view/home/home.dart';
import 'view/login/login.dart';
import 'view/splash/splash.dart';

class AppRouter {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => const Splash()),
    GetPage(name: Home.routeName, page: () => const Home()),
    GetPage(name: Login.routeName, page: () => const Login()),
  ];
}
