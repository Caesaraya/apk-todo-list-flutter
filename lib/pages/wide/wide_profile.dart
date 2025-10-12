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
            const SizedBox(height: 12),

            // Use a fixed proportion of the screen height for the horizontal list
            SizedBox(
              height: mq.height * 0.54,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
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

            const SizedBox(height: 6),
          ],
        ),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage("asset/person.png"),
            ),
            const SizedBox(height: 12),

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
