import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100], // 🌼 sticky note background
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: Colors.yellow[300],
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ), // avatar dummy
            ),
            SizedBox(height: 20),
            Text(
              "Mesah Ronila",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Mesa@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              "Flutter Developer",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
