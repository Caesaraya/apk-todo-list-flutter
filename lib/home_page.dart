import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/widgets/widget_list_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TodoItem(
              title: 'Contoh Todo',
              description: 'Ini adalah deskripsi singkat tugas',
              category: 'Pribadi',
              isChecked: false,
              onCheckChanged: () {
                // Untuk test tampilan saja
                print('Checkbox ditekan');
              },
            ),
          ],
        ),
      ),
    );
  }
}
