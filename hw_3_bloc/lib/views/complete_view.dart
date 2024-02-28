import 'package:flutter/material.dart';
import 'package:hw_3_bloc/constant/colors.dart';
import 'package:hw_3_bloc/constant/space.dart';
import 'package:hw_3_bloc/widgets/list_tile.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage,
      appBar: AppBar(
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
      ),
      body: ListView(
        children:  [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                size48,
                ListTileWidget(
                  nameTodo: "Design app",
                  isCheck: false,
                  isDelete: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
