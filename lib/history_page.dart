import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.yellow[100], // 🌼 sticky note background
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: Colors.yellow[300],
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.completedTodos.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada history!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.completedTodos.length,
          itemBuilder: (context, index) {
            final todo = controller.completedTodos[index];
            return Card(
              elevation: 4,
              shadowColor: Colors.brown.withOpacity(0.3),
              color: Colors.green[100], // ✅ hijau lembut untuk history selesai
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
                    decoration: TextDecoration.lineThrough, // coret → selesai
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
                    if (todo.completedAt != null)
                      Text(
                        'Selesai pada: ${todo.completedAt}',
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
                    controller.deleteFromHistory(todo.id);
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
