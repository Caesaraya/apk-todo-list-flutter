// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/history_page.dart';
import 'package:todolist/models/todo_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          Obx(
            () => IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.history),
                  if (controller.completedTodos.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${controller.completedTodos.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () => Get.to(() => const HistoryPage()),
            ),
          ),
        ],
      ),
      body: Obx(() {
        // Sort todos: completed at the bottom
        final sortedTodos = [...controller.todos];
        sortedTodos.sort((a, b) {
          if (a.progress == TodoProgress.completed && b.progress != TodoProgress.completed) {
            return 1;
          } else if (a.progress != TodoProgress.completed && b.progress == TodoProgress.completed) {
            return -1;
          }
          return 0;
        });

        if (sortedTodos.isEmpty) {
          return const Center(child: Text('Tidak ada todo!'));
        }

        return ListView.builder(
          itemCount: sortedTodos.length,
          itemBuilder: (context, index) {
            final todo = sortedTodos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.description),
                  Text('Category: ${todo.category}'),
                  Text('Progress: ${_getProgressText(todo.progress)}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Progress dropdown
                  PopupMenuButton<TodoProgress>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (TodoProgress progress) {
                      controller.updateProgress(todo.id, progress);
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<TodoProgress>>[
                      const PopupMenuItem<TodoProgress>(
                        value: TodoProgress.notStarted,
                        child: Text('Belum Dikerjakan'),
                      ),
                      const PopupMenuItem<TodoProgress>(
                        value: TodoProgress.inProgress,
                        child: Text('Sedang Dikerjakan'),
                      ),
                      const PopupMenuItem<TodoProgress>(
                        value: TodoProgress.completed,
                        child: Text('Selesai'),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteTodo(todo.id);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        child: const Icon(Icons.add),
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