import 'package:flutter/material.dart';
import 'package:start2/view/TodoScreen.dart';



class ListWidget2 extends StatelessWidget {
  const ListWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
          margin:const EdgeInsets.only(top: 10,bottom: 10),
            width: 338,
            height: 56,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),color: const Color(0xffF5F7F9),),
          child: ListTile(
            
               
            // horizontalTitleGap:16,
            leading:
              
              Image.asset('assets/Rectangle 2.png'),
              title: 
               Text(tasks[index]),
               trailing: 
             IconButton(onPressed: () async{ 
                  // Remove the task from the list when the button is pressed
                 await tasks.removeAt(index);
                  },
              icon:  Image.asset('assets/Frame 30.png'),),
          
          ),
        );
      },
    );
  }
}