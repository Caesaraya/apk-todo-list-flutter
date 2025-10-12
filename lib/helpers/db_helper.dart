import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/models/todo_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            category TEXT,
            progress TEXT,
            completedAt TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE history(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            category TEXT,
            progress TEXT,
            completedAt TEXT
          );
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS history(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              description TEXT,
              category TEXT,
              progress TEXT,
              completedAt TEXT
            );
          ''');
        }
      },
    );
  }

  // 🔹 CREATE
  Future<int> insertTodo(Todo todo) async {
    final client = await db;
    return await client.insert('todos', {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'progress': todo.progress.name,
      'completedAt': todo.completedAt?.toIso8601String(),
    });
  }

  // 🔹 READ
  Future<List<Todo>> getTodos() async {
    final client = await db;
    final maps = await client.query('todos', orderBy: 'rowid DESC');

    return maps.map((map) {
      return Todo(
        id: map['id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        category: map['category'] as String,
        progress: TodoProgress.values.firstWhere(
          (e) => e.name == map['progress'],
          orElse: () => TodoProgress.notStarted,
        ),
        completedAt: map['completedAt'] != null
            ? DateTime.tryParse(map['completedAt'] as String)
            : null,
      );
    }).toList();
  }

  // 🔹 UPDATE
  Future<int> updateTodo(Todo todo) async {
    final client = await db;
    return await client.update(
      'todos',
      {
        'title': todo.title,
        'description': todo.description,
        'category': todo.category,
        'progress': todo.progress.name,
        'completedAt': todo.completedAt?.toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // 🔹 DELETE
  Future<int> deleteTodo(int id) async {
    final client = await db;
    return await client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // 🆕 Tambahan untuk HISTORY

  Future<int> insertHistory(Todo todo) async {
    final client = await db;
    return await client.insert('history', {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'progress': todo.progress.name,
      'completedAt': todo.completedAt?.toIso8601String(),
    });
  }

  Future<List<Todo>> getHistory() async {
    final client = await db;
    final maps = await client.query('history', orderBy: 'completedAt DESC');
    return maps.map((map) {
      return Todo(
        id: map['id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        category: map['category'] as String,
        progress: TodoProgress.values.firstWhere(
          (e) => e.name == map['progress'],
          orElse: () => TodoProgress.completed,
        ),
        completedAt: map['completedAt'] != null
            ? DateTime.tryParse(map['completedAt'] as String)
            : null,
      );
    }).toList();
  }

  Future<int> deleteHistory(int id) async {
    final client = await db;
    return await client.delete('history', where: 'id = ?', whereArgs: [id]);
  }
}
