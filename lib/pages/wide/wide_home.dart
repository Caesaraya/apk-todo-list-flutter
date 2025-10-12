import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/routes/routes.dart';

class WideHomePage extends StatelessWidget {
  WideHomePage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Obx(() {
        final sortedTodos = [...controller.todos];
        sortedTodos.sort((a, b) {
          if (a.progress == TodoProgress.completed &&
              b.progress != TodoProgress.completed)
            return 1;
          if (a.progress != TodoProgress.completed &&
              b.progress == TodoProgress.completed)
            return -1;
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
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(24),
          itemCount: sortedTodos.length,
          itemBuilder: (context, index) {
            final todo = sortedTodos[index];
            return Container(
              margin: const EdgeInsets.all(40),
              child: Card(
                elevation: 4,
                shadowColor: Colors.brown.shade300,
                color: todo.progress == TodoProgress.completed
                    ? Colors.green[100]
                    : Colors.yellow[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul dan menu aksi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              todo.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                decoration:
                                    todo.progress == TodoProgress.completed
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              PopupMenuButton<TodoProgress>(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.brown,
                                ),
                                onSelected: (progress) async {
                                  await controller.updateProgress(
                                    todo.id!,
                                    progress,
                                  );
                                },
                                itemBuilder: (context) =>
                                    const <PopupMenuEntry<TodoProgress>>[
                                      PopupMenuItem(
                                        value: TodoProgress.notStarted,
                                        child: Text('Belum Dikerjakan'),
                                      ),
                                      PopupMenuItem(
                                        value: TodoProgress.inProgress,
                                        child: Text('Sedang Dikerjakan'),
                                      ),
                                      PopupMenuItem(
                                        value: TodoProgress.completed,
                                        child: Text('Selesai'),
                                      ),
                                    ],
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () =>
                                    controller.deleteTodo(todo.id!),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (todo.description.isNotEmpty)
                        Text(
                          todo.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 8),
                      Text(
                        'Kategori: ${todo.category}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 4),
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
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
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
