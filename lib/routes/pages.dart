import 'package:get/get.dart';
import 'package:todolist/add_todo_page.dart';
import 'package:todolist/bindings/login_binding.dart';
import 'package:todolist/bindings/todo_binding.dart';
import 'package:todolist/history_page.dart';
import 'package:todolist/home_page.dart';
import 'package:todolist/login_page.dart';
import 'package:todolist/routes/routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: TodoBinding(),
    ),
    GetPage(name: AppRoutes.history, page: () => HistoryPage(), binding: TodoBinding()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginApp(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: TodoBinding(),
    ),
  ];
}
