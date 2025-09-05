import 'package:get/get.dart';
import '../controller/nav_controller.dart';
import '../controller/todo_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    // Controller navigasi bottom nav
    Get.lazyPut<BottomNavController>(() => BottomNavController());

    // Controller untuk todo (digunakan HomePage & HistoryPage)
    Get.lazyPut<TodoController>(() => TodoController());

    // Kalau Profile butuh controller, bisa tambahkan di sini juga
    // Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
