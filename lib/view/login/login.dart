import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home.dart';

import '../../widgets/MyElevatedButton.dart';
import 'login_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const String routeName = '/login';

  @override
  State<Login> createState() => _State();
}

class _State extends State<Login> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: FlutterLogo(size: 100),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (value) => controller.email = value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "user@example.com",
                          label: Text("Email ID"),
                        ),
                        initialValue: "hello@example.com",
                        validator: (value) {
                          if (GetUtils.isEmail('$value') == false) {
                            return 'This email address looks incorrect';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Obx(
                        () => TextFormField(
                          onSaved: (value) => controller.password = value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: "123456",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.obscure.value,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "******",
                            label: Text("Password"),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: Colors.black54,
                              onPressed: () => controller.obscure.value =
                                  !controller.obscure.value,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Incorrect password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      MyElevatedButton(
                        onPressed: () => submit(),
                        child: const Text('LOGIN'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  submit() {
    if (controller.formKey.currentState!.validate()) {
      controller.formKey.currentState!.save();
      var request = {
        'email': '${controller.email}',
        'password': '${controller.password}',
      };
      print(request);
      Get.offAllNamed(Home.routeName);
      //controller.login(request);
    }
  }
}
