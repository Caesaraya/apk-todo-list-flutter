enum TodoProgress { notStarted, inProgress, completed }

class Todo {
  final String id;
  String title;
  String description;
  String category;
  TodoProgress progress;
  DateTime? completedAt;

  Todo({
    String? id,
    required this.title,
    required this.description,
    required this.category,
    this.progress = TodoProgress.notStarted,
    this.completedAt,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}