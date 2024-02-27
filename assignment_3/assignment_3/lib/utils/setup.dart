import 'package:assignment_3/data_layer/data_services.dart';

import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final locator = GetIt.I;

setup() async {
  locator.registerSingleton<DataServices>(DataServices());
  await GetStorage.init();
}
