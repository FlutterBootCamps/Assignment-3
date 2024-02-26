import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';

Future<void> setup() async{
  await GetStorage.init();

  GetIt.instance.registerSingleton<HomeData>(HomeData());
}