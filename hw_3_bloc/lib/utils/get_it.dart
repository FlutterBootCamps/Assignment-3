import 'package:get_it/get_it.dart';
import 'package:hw_3_bloc/model/to_do.dart';

final locator = GetIt.I;
setup() {
 locator.registerSingleton<Todo>(Todo());
}


