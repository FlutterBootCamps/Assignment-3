

import 'package:todo_app/data_layer/data_service.dart';
import 'package:todo_app/service/setup.dart';

final serviceLocator = locator.get<DataService>();

// to write  the data into local storage.
saveData(){
  box.write("allTasks", serviceLocator.allTask);
  box.write("completedTasks", serviceLocator.completedTask);
  box.save();
}


// to read data from get storage (local storage).
loadTask(){
  if (box.hasData("allTasks")) {
    serviceLocator.allTask = box.read("allTasks");
    print(box.read('allTasks'));
  } else {
   return "No Task Found";
  }

  if (box.hasData('completedTasks')) {
    serviceLocator.completedTask = box.read("completedTasks");
  }
}