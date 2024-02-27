import 'dart:ui';

import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/helper/extintion.dart';
import 'package:assignment_3/pages/to_do_page/delete_task_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksListWelcoming extends StatelessWidget {
  const TasksListWelcoming({super.key, required this.taskNumber});
  final int taskNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: text),
                    ),
                    Text(
                      "John",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blue),
                    ),
                    Text(
                      ".",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: text),
                    ),
                  ],
                ),
                Text(
                    "You've got $taskNumber tasks to do.",
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: text2))
              ],
            ),
            InkWell(
              onTap: () {
                context.pushTo(view: const DeleteTask());
              },
              child: Icon(
                Icons.more_horiz_outlined,
                color: check,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
