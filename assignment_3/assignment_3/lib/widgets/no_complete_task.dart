
import 'package:flutter/material.dart';

class NoCompleteTask extends StatelessWidget {
  const NoCompleteTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          children: [
            Image.asset("assets/images/Check.png"),
            SizedBox(
              height: 10,
            ),
            Text(
              "not complete",
              style: TextStyle(color: Color(0xff8D9CB8)),
            )
          ],
        ),
      ),
    );
  }
}
