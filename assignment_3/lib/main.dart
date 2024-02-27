import 'package:assignment_3/bloc/task_manager_bloc.dart';
import 'package:assignment_3/pages/bottom_nav_page.dart';
import 'package:assignment_3/utils/set_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskManagerBloc(),
      child: const MaterialApp(
        home: BottomNavScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
