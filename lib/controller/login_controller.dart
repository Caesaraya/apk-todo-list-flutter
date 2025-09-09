import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Username dan Password tidak boleh kosong",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;

    if (username == "admin" && password == "123456") {
      Get.snackbar(
        "Success",
        "Login berhasil",
        snackPosition: SnackPosition.TOP,
      );
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar(
        "Error",
        "Username atau Password salah",
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
