import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/data/data_service.dart';

final locater = GetIt.I;
SharedPreferences? prefs;

setup() async {
  locater.registerSingleton<DataService>(DataService());
  prefs = await SharedPreferences.getInstance();
}
