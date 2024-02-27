import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/data_layer/data_service.dart';

final box = GetStorage();
final locator = GetIt.I;

setup()  async{
  await GetStorage.init();

  locator.registerSingleton<DataService>(DataService());
}
