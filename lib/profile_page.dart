import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: ListView(
        children: [
          const SizedBox(height: 20),

          Card(
            color: Colors.yellow[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("asset/person.png"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Caesaraya Junior Nugroho',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '11 PPLG 1 - 08',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: Colors.yellow[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("asset/person.png"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Muhammad Zanadin Akbar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '11 PPLG 1 - 25',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: Colors.yellow[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("asset/person.png"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Zulfikar Azmi Fakhrudin',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '11 PPLG 1 - 37',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
