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
      appBar: AppBar(
        title: const Text('Tambah Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
              onChanged: (String? newValue) {
                controller.selectedCategory = newValue!;
              },
              items: controller.categories
                  .map<DropdownMenuItem<String>>((String value) {
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
                    onPressed: () {
                      controller.saveTodo();
                    },
                    child: const Text('Simpan'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
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
    );
  }
}