import 'package:get/get.dart';

import 'network_manager.dart';

class NetworkBinding {
  static void init() {
    Get.put<NetworkManager>(NetworkManager(), permanent: true);
  }
}
