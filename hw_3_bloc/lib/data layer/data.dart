import 'package:get_storage/get_storage.dart';
import 'package:hw_3_bloc/model/to_do.dart';


class DataHome{

  List<Todo> taskList = [];
  final box = GetStorage();

    addToDo(String todo) {
    taskList.add(Todo(title: todo));
  }
  
  

}