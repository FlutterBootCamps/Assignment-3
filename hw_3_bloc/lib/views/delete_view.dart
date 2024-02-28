import 'package:flutter/material.dart';
import 'package:hw_3_bloc/constant/colors.dart';
import 'package:hw_3_bloc/constant/space.dart';
import 'package:hw_3_bloc/helper/assistant.dart';
import 'package:hw_3_bloc/views/to_do_view.dart';
import 'package:hw_3_bloc/widgets/list_tile.dart';

class DeleteView extends StatelessWidget {
  const DeleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage,
      appBar: AppBar(
        backgroundColor: colorPage,
        leading: IconButton(
            onPressed: () {
              context.pop(context, ToDoPage());
            },
            icon: Icon(Icons.arrow_back_ios_new)),
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
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delete Tasks",
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 20,
                        color: colorText,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Delete all",
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 18,
                        color: Color(0xffFF5E5E),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              size60,
              ListTileWidget(
                nameTodo: "Design app",
                isCheck: true,
                isDelete: true,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
