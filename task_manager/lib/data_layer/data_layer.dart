
import 'package:get_storage/get_storage.dart';
import 'package:task_manager/model/task_model.dart';


class TaskMangerGetStorge {
  List<Task> allTask = [];

  final box = GetStorage();

LoadList(){
if(box.hasData("task"))
allTask=box.read("task");
}

SaveList(){
  box.write("task", allTask);

}

countUncompletedTask(){
  int count=0;
  for(var i=0;i<allTask.length;i++){
    if(allTask[i].isDone==false){
      count++;
    }
  }
  return count;
}


}