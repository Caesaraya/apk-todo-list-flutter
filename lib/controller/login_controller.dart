import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isMobile = true.obs;
  var cardWidth = 400.0.obs;

  login() async {
    if (usernameController.text.toString() == "admin" && passwordController.text.toString() == "admin123") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.dashboard);
    }else{
      Get.snackbar("error", "incorrect username and  password");
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void updateLayout(BoxConstraints constraint){
    isMobile.value = constraint.maxWidth < 600;
  }

  void _updateCardWidth(double width) {
    if (width > 1200) {
      cardWidth.value = width * 0.4;
    } else if (width > 800) {
      cardWidth.value = width * 0.55;
    } else {
      cardWidth.value = width * 0.9;
    }
  }
}
