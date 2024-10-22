import 'package:get/get.dart';

import '../../http/api_repository.dart';
import '../../model/todo.dart';

class HomeController extends GetxController with StateMixin {
  List<Todo> list = [];

  @override
  void onInit() {
    super.onInit();
    //todos();
  }

  void todos() async {
    change(null, status: RxStatus.loading());
    await HttpRepository.apiRequest(RequestType.get, 'todos').then((response) {
      if (response.success) {
        list = (response.data as List).map((i) => Todo.fromJson(i)).toList();
        change(list);
      } else {
        print(response);
      }
    });
    change(null, status: RxStatus.success());
  }
}
