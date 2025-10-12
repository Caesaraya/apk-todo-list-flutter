import 'package:flutter/material.dart';
import 'package:todolist/controller/profile_controller.dart';
import 'package:todolist/widgets/widget_button.dart';
import 'package:get/get.dart';

class WideProfilePage extends StatelessWidget {
  WideProfilePage({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Flexible list area so logout button doesn't cause overflow
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                children: [
                  _buildProfileCard(
                    name: 'Caesaraya Junior Nugroho',
                    kelas: '11 PPLG 1-08',
                    width: mq.width * 0.35,
                  ),
                  _buildProfileCard(
                    name: 'Muhammad Zanadin Akbar',
                    kelas: '11 PPLG 1-25',
                    width: mq.width * 0.35,
                  ),
                  _buildProfileCard(
                    name: 'Zulfikar Azmi Fakhrudin',
                    kelas: '11 PPLG 1-37',
                    width: mq.width * 0.35,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Logout',
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  onPressed: profileController.logout,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String name,
    required String kelas,
    double width = 280,
  }) {
    return Card(
      color: Colors.yellow[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("asset/person.png"),
            ),
            const SizedBox(height: 10),
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
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
