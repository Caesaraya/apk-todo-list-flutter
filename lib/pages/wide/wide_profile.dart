import 'package:flutter/material.dart';
import 'package:todolist/controller/profile_controller.dart';
import 'package:todolist/widgets/widget_button.dart';
import 'package:get/get.dart';

class WideProfilePage extends StatelessWidget {
  WideProfilePage({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Column(
        children: [
          const SizedBox(height: 20),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 80),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: [
                  _buildProfileCard(
                    name: 'Caesaraya Junior Nugroho',
                    kelas: '11 PPLG 1-08',
                  ),
                  _buildProfileCard(
                    name: 'Muhammad Zanadin Akbar',
                    kelas: '11 PPLG 1-25',
                  ),
                  _buildProfileCard(
                    name: 'Zulfikar Azmi Fakhrudin',
                    kelas: '11 PPLG 1-37',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              width: 900,
              child: CustomButton(
                text: 'Logout',
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                onPressed: profileController.logout,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileCard({required String name, required String kelas}) {
    return Card(
      color: Colors.yellow[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("asset/person.png"),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              kelas,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
