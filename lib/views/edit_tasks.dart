import 'package:flutter/material.dart';
import 'package:hw11/views/homescreen.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          children: [Text("Hii")],
        ),
      ),
    );
  }
}
