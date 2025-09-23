import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';

class ProfileController extends GetxController{
  
  logout() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}