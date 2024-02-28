import 'package:flutter/material.dart';
import 'package:hw11/views/edit_tasks.dart';
import 'package:hw11/widgets/custom_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:const  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "John",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/john.png"),
              ),
              ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Wlcome,",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: "John",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff007FFF)))
                    ],
                  ),
                ),
                const Spacer(),
                 IconButton( onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditScreen()));
                  
                 }, icon:Icon(Icons.more_horiz,)),
              ],
            ),
            const Row(
              children: [
                Text(
                  "You’ve got 8 tasks to do.",
                  style: TextStyle(fontSize: 16, color: Color(0xff8D9CB8)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(shrinkWrap: true, children: const [
              CustomTask(
                task: 'Design app',
              ),
              CustomTask(
                task: 'Design sign up flow',
              ),
            ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(shape: CircleBorder(eccentricity: 0),
         backgroundColor: Colors.transparent,
        
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(20),
                height: 400,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height:  30),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                       prefixIcon: Icon(Icons.edit,color: Color(0xffC6CFDC),),
                        hintText: 'Add note...',
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Create'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add_circle_rounded,
          size: 50,color: Color(0xff000000),
        ),
      ),
    );
  } 
}
