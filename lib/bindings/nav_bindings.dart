import 'package:get/get.dart';
import '../controller/nav_controller.dart';
import '../controller/todo_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());

    Get.lazyPut<TodoController>(() => TodoController());
  }
}
