import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/profile_controller.dart';
import 'package:todolist/pages/mobile/mobile_profile.dart';
import 'package:todolist/pages/wide/wide_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? MobileProfilePage()
                : WideProfilePage(),
          );
        },
      ),
    );
  }
}
