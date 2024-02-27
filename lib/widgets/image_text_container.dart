import 'package:flutter/material.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class ImageTextContainer extends StatelessWidget {
  const ImageTextContainer({
    super.key, required this.image, required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 24,),
          Text(text, style: const TextStyle(color: slateBlue, fontFamily: urbanistFont, fontSize: 16, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}