
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/constant/colors.dart';

class PersonInfoRow extends StatelessWidget {
  const PersonInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("John",
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: purpleColor,
                  fontWeight: FontWeight.w600),
            )),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          'assets/images/person.png',
          width: 50,
        )
      ],
    );
  }
}
