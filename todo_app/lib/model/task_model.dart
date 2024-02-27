
class TaskModel {
  TaskModel({
    required this.id,
    required this.taskTitle,
    required this.isComplete,
  });
  late final int id;
  late final String taskTitle;
  late final bool isComplete;
  
  TaskModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    taskTitle = json['taskTitle'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['taskTitle'] = taskTitle;
    _data['isComplete'] = isComplete;
    return _data;
  }
}




// TaskModel t1 = TaskModel(id: 9, taskTitle: "taskTitle", isComplete: true);
// TaskModel t2 = TaskModel(id: 10, taskTitle: "taskTitle", isComplete: false);

// List taskeModel = [(id: 9, taskTitle: "taskTitle", isComplete: true) ,t2];


// {
// "id": 1,
// "taskTitle": "aa",
// "isComplete": true
// }