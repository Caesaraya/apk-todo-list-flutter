import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Obx(() {
        if (controller.completedTodos.isEmpty) {
          return const Center(child: Text('Tidak ada history!'));
        }

        return ListView.builder(
          itemCount: controller.completedTodos.length,
          itemBuilder: (context, index) {
            final todo = controller.completedTodos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.description),
                  Text('Category: ${todo.category}'),
                  if (todo.completedAt != null)
                    Text('Selesai pada: ${todo.completedAt!.toString()}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.deleteFromHistory(todo.id);
                },
              ),
            );
          },
        );
      }),
    );
  }
}