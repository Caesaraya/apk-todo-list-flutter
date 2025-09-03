import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2)); // simulasi loading

    isLoading.value = false;

    // cek username & password secara manual (dummy login)
    if (username == "admin" && password == "123456") {
      Get.snackbar(
        "Success",
        "Login berhasil",
        snackPosition: SnackPosition.BOTTOM,
      );
      // contoh navigasi ke halaman berikut
      // Get.offAll(() => HomePage());
    } else {
      Get.snackbar(
        "Error",
        "Username atau Password salah",
        snackPosition: SnackPosition.BOTTOM,
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
