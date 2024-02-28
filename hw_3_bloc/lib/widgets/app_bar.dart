import 'package:flutter/material.dart';
import 'package:hw_3_bloc/constant/space.dart';
import '../constant/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorPage,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "John",
            style: TextStyle(
                fontFamily: 'Urbanist', fontSize: 18, color: colorText),
          ),
          sizeWidth12,
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/image/pexels-pixabay-220453 1.png',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
