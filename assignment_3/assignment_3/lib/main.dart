import 'package:assignment_3/bloc/todo_bloc.dart';
import 'package:assignment_3/utils/setup.dart';
import 'package:assignment_3/widgets/bottm_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (context) => TodoBloc()..add(LoadingEvent()),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: BottomNavBar()),
    );
  }
}
