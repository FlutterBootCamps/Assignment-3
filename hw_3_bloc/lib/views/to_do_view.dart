import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hw_3_bloc/constant/colors.dart';
import 'package:hw_3_bloc/constant/space.dart';
import 'package:hw_3_bloc/helper/assistant.dart';
import 'package:hw_3_bloc/views/delete_view.dart';
import 'package:hw_3_bloc/widgets/list_tile.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});
  
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
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome, ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist',
                              fontSize: 20,
                              color: colorText,
                            ),
                          ),
                          TextSpan(
                            text: 'John.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist',
                              fontSize: 20,
                              color: colorIcon,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.push(context, DeleteView());
                      },
                      icon: Image.asset('assets/image/tabler_dots.png'),
                    )
                  ],
                ),
                const Text(
                  "You’ve got 8 tasks to do.",
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 16,
                    color: colorTexts,
                  ),
                ),
                size42,
                 ListTileWidget(
                  nameTodo: "Design app",
                  isCheck: true,
                  isDelete: false,
                ),
                size18,
                 ListTileWidget(
                  nameTodo: "Design sign up flow",
                  isCheck: true,
                  isDelete: false,
                ),
                size18,
                 ListTileWidget(
                  nameTodo: "Design use case page",
                  isCheck: true,
                  isDelete: false,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: colorPage,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: context.getHeight(context) / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          size60,
                          Row(
                            children: [
                              Image.asset('assets/image/leading icon.png'),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Add a note...",
                                    helperStyle: const TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 16,
                                    color: Color(0xffC6CFDC),
                                  ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          size60,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                        color: colorIcon,
                                        fontFamily: 'Urbanist',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: SvgPicture.asset('assets/icon/Vector (8).svg')),
    );
  }
}
