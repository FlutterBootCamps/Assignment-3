class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        id: json['id'],
        todoText: json['todoText'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'todoText': todoText,
        'isDone': isDone,
      };

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Design app',),
      ToDo(id: '02', todoText: 'Design sign up flow',),
      ToDo(id: '03', todoText: 'Design use case page',),
      ToDo(id: '04', todoText: 'Create new task UI flow',),
      ToDo(id: '06', todoText: 'Collect project assets',),
      ToDo(id: '06', todoText: 'Collect Skills list',),
    ];
  }

  @override
  String toString() {
    return 'ToDo{id: $id, todoText: $todoText, isDone: $isDone}';
  }
}
