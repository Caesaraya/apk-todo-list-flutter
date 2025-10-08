import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:intl/intl.dart';

class WideHistoryPage extends StatelessWidget {
  const WideHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.yellow[100],
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
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(12),
          itemCount: controller.completedTodos.length,
          itemBuilder: (context, index) {
            final todo = controller.completedTodos[index];
            return Container(
              margin: EdgeInsets.all(40),
              child: Card(
                elevation: 4,
                shadowColor: Colors.brown.shade300,
                color: Colors.green[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              todo.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              controller.deleteFromHistory(todo.id);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (todo.description.isNotEmpty)
                        Expanded(
                          child: Text(
                            todo.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      const Spacer(),
                      Text(
                        'Kategori: ${todo.category}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (todo.completedAt != null)
                        Text(
                          'Selesai pada: ${DateFormat('dd MMM yyyy, HH:mm').format(todo.completedAt!)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.brown,
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
    );
  }
}