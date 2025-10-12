import 'package:get/get.dart';
import 'package:todolist/add_todo_page.dart';
import 'package:todolist/bindings/login_binding.dart';
import 'package:todolist/bindings/nav_bindings.dart';
import 'package:todolist/bindings/profile_binding.dart';
import 'package:todolist/bindings/splashscreen_binding.dart';
import 'package:todolist/bindings/todo_binding.dart';
import 'package:todolist/dashboard_page.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/home_page.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/pages/profile_page.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/splashscreen_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
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
        GetPage(
          name: AppRoutes.profile,
          page: () => ProfilePage(),
          binding: ProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
  ];
}
