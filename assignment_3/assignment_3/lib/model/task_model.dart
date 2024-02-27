class TaskModel {
  late String title;
  late bool isComplete;

  TaskModel({required this.title, this.isComplete = false});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['isComplete'] = isComplete;
    return data;
  }

  TaskModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    isComplete = json['isComplete'];

  }
}
