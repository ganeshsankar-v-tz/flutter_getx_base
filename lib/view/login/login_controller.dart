import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../http/api_repository.dart';

class LoginController extends GetxController with StateMixin {
  final formKey = GlobalKey<FormState>();
  var obscure = true.obs;
  var email, password;

  @override
  void onInit() {
    super.onInit();
  }

  void login(Map<String, String> request) async {
    await HttpRepository.apiRequest(
      RequestType.post,
      'posts',
      request: request,
    ).then((response) {
      if (response.success) {
        /*var json = jsonDecode(response.data);
        var data = json['data'];
        var loginResponse = LoginResponse.fromJson(data);
        prefs.setString("token", loginResponse.token);
        Get.offAllNamed(MainScreen.routeName);*/
      } else {
        print('error: ${response.data}');
      }
    });
  }
}
