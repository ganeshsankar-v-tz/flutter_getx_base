import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_base/utils/app_theme.dart';

import 'home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = '/home';

  @override
  State<Home> createState() => _state();
}

class _state extends State<Home> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('APP NAME'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: 5,
          itemBuilder: (context, index) {
            var item = 'PRODUCT #${index + 1}';
            return ListTile(
              onTap: () async {
                bool value = AppTheme().isDarkMode;
                value = !value;
                AppTheme().updateThemeStatus(value);
              },
              contentPadding: const EdgeInsets.all(12),
              title: Text(item),
              subtitle: const Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page.'),
            );
          },
        ),
      );

      /*return CoreWidget(
        loadingStatus: controller.status.isLoading,
        appBar: AppBar(title:  Text('${Theme.of(context).primaryColor}')),
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              var item = controller.list[index];
              return ListTile(title: Text(item.title));
            }),
      );*/
    });
  }
}
