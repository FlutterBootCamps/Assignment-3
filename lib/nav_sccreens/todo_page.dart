import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key}); // Constructor

  TextEditingController taskController = TextEditingController(); // Controller for text input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                // Welcome message
                RichText(
                  text: const TextSpan(
                    text: "Welcome,",
                    style: TextStyle(
                      color: Color(0xff3f3d56),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: " John",
                        style: TextStyle(
                          color: Color(0xff007fff),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(
                          color: Color(0xff3f3d56),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 166),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz, color: Color(0xffc6cfdc)),
                ),
              ],
            ),
            const Row(
              children: [
                // Task count message
                Text(
                  "You've got 1 tasks to do.",
                  style: TextStyle(
                    color: Color(0xff8d9cb8),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListTile(
                tileColor: Color(0xfff5f7f9),
                leading: Icon(Icons.check_box_outline_blank, color: Color(0xffc6cfcd)),
                title: const Text(
                  "Display tasks",
                  style: TextStyle(fontFamily: "Urbanist", fontSize: 16),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: taskController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.edit),
                              labelText: 'Add a note',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                        ),
                        child: Text('Create'),
                        onPressed: () {
                          Navigator.pop(context); // Close bottom sheet
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.transparent,
        child: Image.asset("images/Vector.png"),
      ),
    );
  }
}
