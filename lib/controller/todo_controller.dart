import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/models/todo_model.dart';

class TodoController extends GetxController {
  // Reactive lists menggunakan .obs
  final _todos = <Todo>[].obs;

  // TextEditingControllers for the form
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // Category options
  final List<String> categories = ['sekolah', 'keseharian', 'ekonomi'];
  String selectedCategory = 'sekolah';

  // Getter untuk akses data
  List<Todo> get todos => _todos.where((todo) => todo.progress != TodoProgress.completed).toList();
  List<Todo> get completedTodos => _todos.where((todo) => todo.progress == TodoProgress.completed).toList();

  // Method untuk menambahkan todo baru
  void addTodo({
    required String title,
    required String description,
    required String category,
  }) {
    final newTodo = Todo(
      title: title,
      description: description,
      category: category,
    );
    _todos.add(newTodo);
  }

  // Method untuk menyimpan todo dari form
  void saveTodo() {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Judul tidak boleh kosong');
      return;
    }

    addTodo(
      title: titleController.text,
      description: descriptionController.text,
      category: selectedCategory,
    );

    // Clear the form
    titleController.clear();
    descriptionController.clear();
    
    // Go back to the previous screen
    Get.back();
  }

  // Method untuk mengubah progress todo
  void updateProgress(String id, TodoProgress progress) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.progress = progress;
    
    if (progress == TodoProgress.completed) {
      todo.completedAt = DateTime.now();
    }
    
    _todos.refresh(); // Refresh list untuk update UI
  }

  // Method untuk menghapus todo
  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }

  // Method untuk menghapus todo dari history
  void deleteFromHistory(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }

  // Method untuk edit todo
  void editTodo(String id, {
    String? title,
    String? description,
    String? category,
    TodoProgress? progress,
  }) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    if (title != null) todo.title = title;
    if (description != null) todo.description = description;
    if (category != null) todo.category = category;
    if (progress != null) todo.progress = progress;
    _todos.refresh(); // Refresh list untuk update UI
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}