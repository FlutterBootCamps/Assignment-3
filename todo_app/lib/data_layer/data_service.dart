// import 'package:todo_app/dataset/task.dataset.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/service/method.dart';

class DataService {

  List<TaskModel> allTask = [];
  List<TaskModel> completedTask = [];

  // void showAllTasks() async{
  //   if(allTask.isEmpty){
  //     for (var element in taskDataSet) {
  //       allTask.add(TaskModel.fromJson(element));
  //      await saveData();
        
  //       loadTask();
  //       // print(allTask.length);
  //       // print("add as tasks");
  //     }
  //   }
  // }

  void createNewTask( String title) async{
    bool isComplete = false;
    TaskModel newTask = TaskModel(id: allTask.length+1 , taskTitle: title, isComplete: isComplete);
    allTask.add(newTask);
    print("git it add task to list ");
    await saveData(); 
    print("save task to get storage ");

  }

  void completeTask(TaskModel task) async{
    if(completedTask.isEmpty || !completedTask.contains(task)){
      // task.isComplete = !task.isComplete; 
      completedTask.add(task);
      deleteOneTask(task);

     await saveData();
    }
  }

  deleteOneTask(TaskModel task) async {
      allTask.removeWhere((element) => element == task,);
      await saveData();
  }

  void deleteAlleTask() async {
      allTask.clear(); 
      await saveData(); 
  }
  

}
