enum TodoProgress { notStarted, inProgress, completed }

class Todo {
  int? id;
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
}
