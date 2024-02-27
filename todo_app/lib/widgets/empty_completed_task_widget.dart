import 'package:flutter/material.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/helper/extention.dart';

class EmptyCompletedTask extends StatelessWidget {
  const EmptyCompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      height: context.getWidth(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("asset/images/non_complete.png"),
          const Text(
            "not complete",
            style: TextStyle(
                color: lightGrey, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
