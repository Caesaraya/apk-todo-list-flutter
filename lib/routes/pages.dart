import 'package:get/get.dart';
import 'package:todolist/bindings/login_bindings.dart';
import 'package:todolist/login_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/login', page: () => LoginApp(), binding: LoginBinding()),
  ];
}
