import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/nav_controller.dart';
import 'package:todolist/home_page.dart';
import 'package:todolist/history_page.dart';
import 'package:todolist/profile_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<BottomNavController>();

    // Daftar halaman bottom nav
    final pages = const [HomePage(), HistoryPage(), ProfilePage()];

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.yellow.shade100,
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow.shade300,
          currentIndex: navController.currentIndex.value,
          onTap: (index) => navController.changeIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.brown.shade300,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
