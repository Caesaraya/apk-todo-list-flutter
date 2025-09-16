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

    // Daftar halaman
    final pages = const [HomePage(), HistoryPage(), ProfilePage()];

    // Daftar judul sesuai halaman
    final titles = ["Home", "History", "Profile"];

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.yellow.shade100,
        appBar: AppBar(
          title: Text(
            titles[navController.currentIndex.value], // ✅ title dinamis
            style: const TextStyle(color: Colors.brown),
          ),
          backgroundColor: Colors.yellow.shade300,
          iconTheme: const IconThemeData(color: Colors.brown),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow.shade300),
                child: const Text(
                  "Menu",
                  style: TextStyle(color: Colors.brown, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.brown),
                title: const Text("Home"),
                selected: navController.currentIndex.value == 0,
                selectedTileColor: Colors.yellow.shade200,
                onTap: () {
                  navController.changeIndex(0);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.brown),
                title: const Text("History"),
                selected: navController.currentIndex.value == 1,
                selectedTileColor: Colors.yellow.shade200,
                onTap: () {
                  navController.changeIndex(1);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.brown),
                title: const Text("Profile"),
                selected: navController.currentIndex.value == 2,
                selectedTileColor: Colors.yellow.shade200,
                onTap: () {
                  navController.changeIndex(2);
                  Get.back();
                },
              ),
            ],
          ),
        ),
        body: pages[navController.currentIndex.value],
      ),
    );
  }
}
