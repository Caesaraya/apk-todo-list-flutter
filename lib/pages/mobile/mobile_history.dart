import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';

class MobileHistoryPage extends StatelessWidget {
  const MobileHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Tugas',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow[200],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      backgroundColor: Colors.yellow[100],
      body: Obx(() {
        final completedTodos = controller
            .historyTodos; // 🔥 Ganti dari completedTodos ke historyTodos

        if (completedTodos.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada history!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: completedTodos.length,
          itemBuilder: (context, index) {
            final Todo todo = completedTodos[index];
            return Card(
              elevation: 4,
              shadowColor: Colors.brown.shade300,
              color: Colors.green[100],
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (todo.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(todo.description),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      'Kategori: ${todo.category}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.brown,
                      ),
                    ),
                    if (todo.completedAt != null)
                      Text(
                        'Selesai pada: ${DateFormat('dd MMMM yyyy, HH:mm').format(todo.completedAt!)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.brown,
                        ),
                      ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    controller.deleteFromHistory(
                      todo.id!,
                    ); // 🔥 pastikan deleteFromHistory menerima int
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
