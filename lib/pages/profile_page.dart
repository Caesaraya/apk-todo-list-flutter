import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/pages/mobile/mobile_profile.dart';
import 'package:todolist/pages/wide/wide_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          todoController.updateLayout(constraints);
          return Obx(
            () => todoController.isMobile.value
                ? MobileProfilePage()
                : WideProfilePage(),
          );
        },
      ),
    );
  }
}
