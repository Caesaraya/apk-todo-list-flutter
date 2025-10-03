import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/pages.dart';
import 'package:todolist/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tugas Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPages.routes,
    );
  }
}
