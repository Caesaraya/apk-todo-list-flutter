import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';

class WideHistoryPage extends StatelessWidget {
  const WideHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Obx(() {
        final completedTodos = controller.historyTodos;

        if (completedTodos.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada history!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }

        final mq = MediaQuery.of(context).size;

        return SizedBox(
          height: mq.height * 0.72,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: completedTodos.length,
            itemBuilder: (context, index) {
              final Todo todo = completedTodos[index];
              return Container(
                width: 340,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.brown.shade300,
                  color: Colors.green[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul dan tombol hapus
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
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                controller.deleteFromHistory(todo.id!);
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        if (todo.description.isNotEmpty)
                          Text(
                            todo.description,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          )
                        else
                          const SizedBox.shrink(),

                        const Spacer(),

                        Text(
                          'Kategori: ${todo.category}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 6),

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
          ),
        );
      }),
    );
  }
}
