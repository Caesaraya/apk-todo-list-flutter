import 'package:get/get.dart';
import 'package:todolist/add_todo_page.dart';
import 'package:todolist/bindings/login_binding.dart';
import 'package:todolist/bindings/nav_bindings.dart';
import 'package:todolist/bindings/todo_binding.dart';
import 'package:todolist/dashboard_page.dart';
import 'package:todolist/history_page.dart';
import 'package:todolist/home_page.dart';
import 'package:todolist/login_page.dart';
import 'package:todolist/profile_page.dart';
import 'package:todolist/routes/routes.dart';

class AppPages {
  static final routes = [
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
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: NavBinding(),
      children: [
        GetPage(name: AppRoutes.home, page: () => HomePage()),
        GetPage(name: AppRoutes.history, page: () => HistoryPage()),
        GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
      ],
    ),
  ];
}
