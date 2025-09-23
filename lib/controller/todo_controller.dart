import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/widgets/widget_button.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final List<String> categories = ['sekolah', 'keseharian', 'ekonomi'];
  String selectedCategory = 'sekolah';

  List<Todo> get todos =>
      _todos.where((todo) => todo.progress != TodoProgress.completed).toList();
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.progress == TodoProgress.completed).toList();

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

    titleController.clear();
    descriptionController.clear();

    Get.back();
  }

  void updateProgress(String id, TodoProgress progress) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.progress = progress;

    if (progress == TodoProgress.completed) {
      todo.completedAt = DateTime.now();
    }

    _todos.refresh();
  }

  void deleteTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);

    Get.defaultDialog(
      title: 'Hapus Todo',
      middleText: 'Yakin ingin menghapus "${todo.title}"?',
      textCancel: 'Batal',
      textConfirm: 'Hapus',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        _todos.removeWhere((todo) => todo.id == id);
        Get.back();
        Get.snackbar('Berhasil', 'Todo dihapus');
      },
    );
  }

  void deleteFromHistory(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);

    Get.defaultDialog(
      title: 'Hapus History',
      middleText: 'Hapus "${todo.title}" dari history?',
      textCancel: 'Batal',
      textConfirm: 'Hapus',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        _todos.removeWhere((todo) => todo.id == id);
        Get.back();
        Get.snackbar('Berhasil', 'History dihapus');
      },
    );
  }

  void showDeleteDialog(String id, {bool isFromHistory = false}) {
    final todo = _todos.firstWhere((todo) => todo.id == id);

    Get.dialog(
      AlertDialog(
        title: Text(isFromHistory ? 'Hapus History' : 'Hapus Todo'),
        content: Text('Yakin ingin menghapus "${todo.title}"?'),
        actions: [
          CustomButton(
            text: 'Batal',
            backgroundColor: Colors.white,
            textColor: Colors.grey,
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 8),
          CustomButton(
            backgroundColor: Colors.red,
            text: 'Hapus',
            textColor: Colors.white,
            onPressed: () {
              _todos.removeWhere((todo) => todo.id == id);
              Get.back();
              Get.snackbar(
                'Berhasil',
                isFromHistory ? 'History dihapus' : 'Todo dihapus',
              );
            },
          ),
        ],
      ),
    );
  }

  void editTodo(
    String id, {
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
