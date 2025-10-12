// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/helpers/db_helper.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;
  final historyTodos = <Todo>[].obs; // ✅ ini yang digunakan UI
  final dbHelper = DBHelper();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var isMobile = true.obs;
  final List<String> categories = ['sekolah', 'keseharian', 'ekonomi'];
  String selectedCategory = 'sekolah';

  // =========================
  // ===== CRUD SECTION =====
  // =========================

  List<Todo> get todos =>
      _todos.where((todo) => todo.progress != TodoProgress.completed).toList();

  // 🔹 Tambah Todo
  Future<void> addTodo({
    required String title,
    required String description,
    required String category,
  }) async {
    final newTodo = Todo(
      title: title,
      description: description,
      category: category,
    );

    final insertedId = await dbHelper.insertTodo(newTodo);
    final todoWithId = newTodo.copyWith(id: insertedId);
    _todos.add(todoWithId);
    await loadTodos(); // sync ulang
  }

  // 🔹 Load Todos
  Future<void> loadTodos() async {
    final todosFromDb = await dbHelper.getTodos();
    _todos.assignAll(todosFromDb);
  }

  // 🔹 Load History (❗ gunakan historyTodos, bukan history)
  Future<void> loadHistory() async {
    final historyFromDb = await dbHelper.getHistory();
    historyTodos.assignAll(historyFromDb);
    print("✅ History loaded: ${historyFromDb.length} item");
  }

  // 🔹 Simpan Todo dari form
  Future<void> saveTodo() async {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Judul tidak boleh kosong');
      return;
    }

    await addTodo(
      title: titleController.text,
      description: descriptionController.text,
      category: selectedCategory,
    );

    titleController.clear();
    descriptionController.clear();
    Get.back();
  }

  // 🔹 Hapus Todo
  void deleteTodo(int id) {
    final todo = _todos.firstWhereOrNull((t) => t.id == id);
    if (todo == null) return;

    Get.defaultDialog(
      title: 'Hapus Todo',
      middleText: 'Yakin ingin menghapus "${todo.title}"?',
      textCancel: 'Batal',
      textConfirm: 'Hapus',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        await dbHelper.deleteTodo(id);
        _todos.removeWhere((t) => t.id == id);
        Get.back();
        Get.snackbar('Berhasil', 'Todo dihapus');
      },
    );
  }

  // 🔹 Update Progress
  Future<void> updateProgress(int id, TodoProgress progress) async {
    final todo = _todos.firstWhere((t) => t.id == id);
    todo.progress = progress;

    if (progress == TodoProgress.completed) {
      todo.completedAt = DateTime.now();

      // simpan ke history & hapus dari todos
      await dbHelper.insertHistory(todo);
      await dbHelper.deleteTodo(id);

      _todos.removeWhere((t) => t.id == id);
      await loadHistory(); // ✅ langsung refresh history
    } else {
      todo.completedAt = null;
      await dbHelper.updateTodo(todo);
    }

    _todos.refresh();
  }

  // 🔹 Hapus dari History
  Future<void> deleteFromHistory(int id) async {
    await dbHelper.deleteHistory(id);
    historyTodos.removeWhere((t) => t.id == id);
    Get.snackbar('Berhasil', 'History dihapus');
  }

  // =========================
  // ===== Lifecycle =========
  // =========================
  @override
  void onInit() {
    super.onInit();
    loadTodos();
    loadHistory(); // ✅ load dari database saat app dibuka
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void updateLayout(BoxConstraints constraint) {
    isMobile.value = constraint.maxWidth < 600;
  }
}
