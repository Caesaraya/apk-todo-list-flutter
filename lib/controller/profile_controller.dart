import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:todolist/routes/routes.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Apakah Anda yakin ingin keluar?",
      textCancel: "Batal",
      textConfirm: "Logout",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        // Tutup dialog
        Get.back();
        // Bersihkan data login yang tersimpan
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        // Arahkan kembali ke halaman login
        Get.offAllNamed(AppRoutes.login);
      },
    );
  }
}
