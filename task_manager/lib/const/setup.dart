import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager/data_layer/data_layer.dart';

Future<void> setup() async {
  await GetStorage.init();

  GetIt.instance;
  GetIt.I.registerSingleton<TaskMangerGetStorge>(TaskMangerGetStorge());
}
