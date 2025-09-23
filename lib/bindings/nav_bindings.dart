import 'package:get/get.dart';
import 'package:todolist/controller/profile_controller.dart';
import '../controller/nav_controller.dart';
import '../controller/todo_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
