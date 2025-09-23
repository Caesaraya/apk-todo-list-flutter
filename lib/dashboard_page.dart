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
    final pages = const [HomePage(), HistoryPage(), ProfilePage()];
    final titles = ["Home", "History", "Profile"];

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.yellow.shade100,
        appBar: AppBar(
          title: Text(
            titles[navController.currentIndex.value],
            style: const TextStyle(color: Colors.brown),
          ),
          backgroundColor: Colors.yellow.shade300,
          iconTheme: const IconThemeData(color: Colors.brown),
        ),
        drawer: Drawer(
          backgroundColor: Colors.yellow.shade50,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow),
                accountName: const Text(
                  "Caesaraya",
                  style: TextStyle(color: Colors.brown),
                ),
                accountEmail: const Text(
                  "Zulzar@gmail.com",
                  style: TextStyle(color: Colors.brown),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("asset/person.png"),
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
