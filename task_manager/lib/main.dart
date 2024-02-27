import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_maneger_bloc.dart';
import 'package:task_manager/component/bottom_navigation_bar.dart';
import 'package:task_manager/const/setup.dart';

void main() {
 setup();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:BlocProvider(
        create: (context) => TaskManegerBloc(),
        child: BottomNavigationBarState(),
      ) 
    );
  }
}
