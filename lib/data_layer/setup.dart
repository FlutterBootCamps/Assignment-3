import 'package:get_storage/get_storage.dart';

setup()async{

  await GetStorage.init();
}
final box = GetStorage();
