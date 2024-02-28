


import 'package:start2/data_layer/setup.dart';
import 'package:start2/view/TodoScreen.dart';

saveData()async {
  await box.write('task',name);
  await box.write('newtask',newtask);

  box.save();

}
loadData(){

if(box.hasData("task")){
name = box.read("task");
}else{
name = "error";
}

newtask = box.read("newtask") ?? tasks;
}