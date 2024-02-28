import 'package:flutter/material.dart';
import 'package:start2/data_layer/setup.dart';
import 'package:start2/view/Bottom_nav_bar.dart';

Future<void> main(List<String> args) async {
  await setup();
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavBar(),
    );
  }
}