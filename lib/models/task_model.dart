class Task {
  Task({
    required this.task,
    required this.isCompleted,
  });
  late String task;
  late bool isCompleted;
  
  Task.fromJson(Map<String, dynamic> json){
    task = json['task'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['task'] = task;
    _data['isCompleted'] = isCompleted;
    return _data;
  }
}