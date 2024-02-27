import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/screena/botton_nav_bar.dart';
import 'package:todo_app/service/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
