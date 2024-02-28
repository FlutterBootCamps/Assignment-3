import 'package:flutter/material.dart';
import 'package:start2/view/TodoScreen.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       appBar: const PreferredSize(
          preferredSize: Size(20, 50), child: AppBarWidget()),
      //backgroundColor: Color.fromARGB(255, 157, 182, 173),

    );
  }
}