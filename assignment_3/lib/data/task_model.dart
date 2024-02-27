
class TasksModel {
  TasksModel({
    required this.title,
  });
  late final String title;
  
  TasksModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}