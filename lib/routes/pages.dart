import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/login_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/login', page: () => LoginScreen()),
    // Tambahkan halaman lain di sini jika diperlukan
  ];
}
