import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/login_controller.dart';
import 'package:todolist/pages/mobile/mobile_login.dart';
import 'package:todolist/pages/wide/wide_login.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          loginController.updateLayout(constraints);
          return Obx(
            () => loginController.isMobile.value
                ? MobileLoginPage()
                : WideLoginPage(),
          );
        },
      ),
    );
  }
}
