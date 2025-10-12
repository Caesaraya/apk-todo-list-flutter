import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/pages/mobile/mobile_history.dart';
import 'package:todolist/pages/wide/wide_history.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value ? MobileHistoryPage() : WideHistoryPage());
        },
      ),
    );
  }
}