class TodoTask {
  final String title;
  bool isDone;

  TodoTask(this.title, {this.isDone = false});
Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  factory TodoTask.fromJson(Map<String, dynamic> json) {
    return TodoTask(
      json['title'],
      isDone: json['isDone'] ?? false,
    );
  }
}
