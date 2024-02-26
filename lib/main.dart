import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_task_manager/bloc/task_bloc.dart';
import 'package:tasky_task_manager/screens/navigation_page.dart';
import 'package:tasky_task_manager/utils/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: NavigationPage()),
    );
  }
}
