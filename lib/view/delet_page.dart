import 'package:flutter/material.dart';
import 'package:start2/view/TodoScreen.dart';
import 'package:start2/widget/listwidget2.dart';

class DeletPage extends StatelessWidget {
  const DeletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(20, 50), child: AppBarWidget()),
      // backgroundColor: Colors.amber,
      // body: SafeArea(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Delete Tasks '),
                 
                  const SizedBox(
                    width: 193,
                  ),
                 InkWell(child: const Text('Delet all'),onTap: () {
                   
                 },)
                ],
              ),
      const SizedBox(
                height: 625,
                  child: ListWidget2(),//Image.asset('assets/Frame 30.png')
                ),
    ]),
    ),
    ),
    );
  }
}