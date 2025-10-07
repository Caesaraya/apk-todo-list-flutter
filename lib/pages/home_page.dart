import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/pages/mobile/mobile_home.dart';
import 'package:todolist/pages/wide/wide_home.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value ? MobileHomePage() : WideHomePage());
        },
      ),
    );
  }
}