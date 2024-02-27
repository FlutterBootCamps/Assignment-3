import 'package:assignment_3/extensions/screen_handler.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTaskButton extends StatelessWidget {
  AddTaskButton({super.key, this.onTap, required this.controller});

  Function()? onTap;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: context.getWidth(),
                height: context.getHeight() * 0.50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                       TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            hintText: "Add a note...",
                            prefixIcon: Icon(Icons.edit),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onTap,
                            child: const Text(
                              "Create",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: const Icon(
        Icons.add,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
