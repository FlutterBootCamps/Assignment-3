import 'package:flutter/material.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class WelcomeSentence extends StatelessWidget {
  const WelcomeSentence({
    super.key, required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(text: "Welcome, ", style: const TextStyle(color: slatePurple, fontFamily: urbanistFont, fontSize: 20, fontWeight: FontWeight.bold), children: [
      TextSpan(text: name, style: const TextStyle(color: oceanBlueColor, fontFamily: urbanistFont, fontSize: 20, fontWeight: FontWeight.bold)),
      const TextSpan(text: ".", style: TextStyle(color: slatePurple, fontFamily: urbanistFont, fontSize: 20, fontWeight: FontWeight.bold),)
    ]));
  }
}
