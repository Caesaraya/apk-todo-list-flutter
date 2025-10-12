enum TodoProgress { notStarted, inProgress, completed }

class Todo {
  final int? id;
  String title;
  String description;
  String category;
  TodoProgress progress;
  DateTime? completedAt;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.progress = TodoProgress.notStarted,
    this.completedAt,
  });
  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    TodoProgress? progress,
    DateTime? completedAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      progress: progress ?? this.progress,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
