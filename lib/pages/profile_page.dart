import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/login_controller.dart';
import 'package:todolist/pages/mobile/mobile_profile.dart';
import 'package:todolist/pages/wide/wide_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          loginController.updateLayout(constraints);
          return Obx(
            () => loginController.isMobile.value
                ? MobileProfilePage()
                : WideProfilePage(),
          );
        },
      ),
    );
  }
}
