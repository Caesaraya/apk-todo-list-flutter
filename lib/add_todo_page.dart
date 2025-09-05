// pages/add_todo_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/widgets/widget_textfield.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.yellow[100], // 🌼 background sticky note
      appBar: AppBar(
        title: const Text(
          'Tambah Todo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        backgroundColor: Colors.yellow[300],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // ✅ biar tidak overflow
          child: Column(
            children: [
              // Judul Todo
              textfield(
                hintText: 'Judul Todo',
                controller: controller.titleController,
                prefixIcon: Icons.title,
              ),
              const SizedBox(height: 16),

              // Deskripsi
              textfield(
                hintText: 'Deskripsi',
                controller: controller.descriptionController,
                prefixIcon: Icons.description,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 16),

              // Kategori Dropdown
              DropdownButtonFormField<String>(
                value: controller.selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  labelStyle: const TextStyle(color: Colors.brown),
                  filled: true,
                  fillColor: Colors.yellow[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
                onChanged: (String? newValue) {
                  controller.selectedCategory = newValue!;
                },
                items: controller.categories.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                        foregroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        controller.saveTodo();
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.brown,
                        side: const BorderSide(color: Colors.brown),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Batal'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
