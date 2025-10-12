// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/widgets/widget_button.dart';
import 'package:todolist/helpers/db_helper.dart'; // pastikan path sesuai

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;
  final historyTodos = <Todo>[].obs;
  final dbHelper = DBHelper();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var isMobile = true.obs;

  final List<String> categories = ['sekolah', 'keseharian', 'ekonomi'];
  String selectedCategory = 'sekolah';

  List<Todo> get todos =>
      _todos.where((todo) => todo.progress != TodoProgress.completed).toList();
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.progress == TodoProgress.completed).toList();

  // 🔹 Load semua data dari database

  // 🔹 Tambah todo ke database
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
    // simpan id yang dikembalikan oleh database ke objek todo
    newTodo.id = insertedId;
    _todos.add(newTodo);
  }

  // 🔹 Simpan todo dari form input
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

  // 🔹 Hapus todo (dari daftar aktif)
  void deleteTodo(id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    Get.defaultDialog(
      title: 'Hapus Todo',
      middleText: 'Yakin ingin menghapus "${todo.title}"?',
      textCancel: 'Batal',
      textConfirm: 'Hapus',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        await dbHelper.deleteTodo(id);
        _todos.removeWhere((todo) => todo.id == id);
        Get.back();
        Get.snackbar('Berhasil', 'Todo dihapus');
      },
    );
  }

  void showDeleteDialog(id, {bool isFromHistory = false}) {
    final todo = _todos.firstWhere((todo) => todo.id == id);

    Get.dialog(
      AlertDialog(
        title: Text(isFromHistory ? 'Hapus History' : 'Hapus Todo'),
        content: Text('Yakin ingin menghapus "${todo.title}"?'),
        actions: [
          CustomButton(
            text: 'Batal',
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey,
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 8),
          CustomButton(
            backgroundColor: Colors.red,
            text: 'Hapus',
            foregroundColor: Colors.white,
            onPressed: () async {
              await dbHelper.deleteTodo(id);
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

  //  Edit todo (dan simpan ke database)
  Future<void> editTodo(
    int id, {
    String? title,
    String? description,
    String? category,
    TodoProgress? progress,
  }) async {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    if (title != null) todo.title = title;
    if (description != null) todo.description = description;
    if (category != null) todo.category = category;
    if (progress != null) todo.progress = progress;
    await dbHelper.updateTodo(todo);
    _todos.refresh();
  }

  // 🔹 Load semua data dari database
  Future<void> fetchTodos() async {
    final todosFromDb = await dbHelper.getTodos();
    _todos.assignAll(todosFromDb);
  }

  Future<void> fetchHistory() async {
    final historyFromDb = await dbHelper.getHistory();
    historyTodos.assignAll(historyFromDb);
  }

  // 🔹 Update progress todo (update + pindahkan ke history kalau selesai)
  Future<void> updateProgress(id, TodoProgress progress) async {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.progress = progress;

    if (progress == TodoProgress.completed) {
      todo.completedAt = DateTime.now();

      // simpan ke history & hapus dari todos
      await dbHelper.insertHistory(todo);
      await dbHelper.deleteTodo(id);

      _todos.removeWhere((t) => t.id == id);
      await fetchHistory(); // refresh history list
      Get.snackbar('Selesai', 'Tugas dipindahkan ke riwayat');
    } else {
      todo.completedAt = null;
      await dbHelper.updateTodo(todo);
    }

    _todos.refresh();
  }

  // 🔹 Hapus dari history
  void deleteFromHistory(int id) async {
    await dbHelper.deleteHistory(id);
    historyTodos.removeWhere((todo) => todo.id == id);
    Get.snackbar('Berhasil', 'History dihapus');
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodos(); // load data dari DB pas awal
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
