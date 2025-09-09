// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.yellow[100], // 🌼 warna background lembut
      appBar: AppBar(backgroundColor: Colors.yellow[100]),
      body: Obx(() {
        final sortedTodos = [...controller.todos];
        sortedTodos.sort((a, b) {
          if (a.progress == TodoProgress.completed &&
              b.progress != TodoProgress.completed) {
            return 1;
          } else if (a.progress != TodoProgress.completed &&
              b.progress == TodoProgress.completed) {
            return -1;
          }
          return 0;
        });

        if (sortedTodos.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada todo!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: sortedTodos.length,
          itemBuilder: (context, index) {
            final todo = sortedTodos[index];
            return Card(
              elevation: 4,
              shadowColor: Colors.brown.shade300,
              color: todo.progress == TodoProgress.completed
                  ? Colors.green[100]
                  : Colors.yellow[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: todo.progress == TodoProgress.completed
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (todo.description.isNotEmpty) Text(todo.description),
                    const SizedBox(height: 4),
                    Text(
                      'Kategori: ${todo.category}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Progress: ${_getProgressText(todo.progress)}',
                      style: TextStyle(
                        color: todo.progress == TodoProgress.completed
                            ? Colors.green[700]
                            : Colors.brown,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopupMenuButton<TodoProgress>(
                      icon: const Icon(Icons.more_vert, color: Colors.brown),
                      onSelected: (progress) {
                        controller.updateProgress(todo.id, progress);
                      },
                      itemBuilder: (context) => <PopupMenuEntry<TodoProgress>>[
                        const PopupMenuItem(
                          value: TodoProgress.notStarted,
                          child: Text('Belum Dikerjakan'),
                        ),
                        const PopupMenuItem(
                          value: TodoProgress.inProgress,
                          child: Text('Sedang Dikerjakan'),
                        ),
                        const PopupMenuItem(
                          value: TodoProgress.completed,
                          child: Text('Selesai'),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        controller.deleteTodo(todo.id);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        onPressed: () {
          Get.toNamed(AppRoutes.addTodo);
        },
        child: const Icon(Icons.add, color: Colors.brown),
      ),
    );
  }

  String _getProgressText(TodoProgress progress) {
    switch (progress) {
      case TodoProgress.notStarted:
        return 'Belum Dikerjakan';
      case TodoProgress.inProgress:
        return 'Sedang Dikerjakan';
      case TodoProgress.completed:
        return 'Selesai';
    }
  }
}
