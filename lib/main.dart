import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/pages/bottom_nav.dart';
import 'package:todo_list/pages/todo_page.dart';
import 'package:todo_list/service/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListBloc(),
      child: MaterialApp(home: BottomNav()),
    );
  }
}
