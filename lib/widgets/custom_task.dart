import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key, required this.task});
  final String task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 56,
            width: 338,
            decoration: const BoxDecoration(
                color: Color(0xffF5F7F9),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                const Icon(
                  Icons.check_box_outline_blank,
                  color: Color(0xffC6CFDC),
                ),
                Text(
                  task,
                  style: const TextStyle(color: Color(0xff3F3D56)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
























        // FloatingActionButton(onPressed: (){}),Icon(Icons.add_circle)
