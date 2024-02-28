// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:start2/data_layer/methods.dart';
import 'package:start2/view/delet_page.dart';
String name = "no name";
List newtask =[];
List tasks = [
  'Design app',
  'Design sign up flow',
  'Design use case page',
  'Test Wireframe',
  'Create new task UI flow',
  'Collect project assets',
  'Collect Skills list',
  'Design use case page'
];

class TodoScreen extends StatefulWidget {
   const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
   TextEditingController nameController = TextEditingController();

 void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
        
          height: 423,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child:  Container(
            margin: const EdgeInsets.all(24),
            height: 44,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Colors.grey[850],
            ),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a note...',
                    hintStyle: const TextStyle(color: Color(0xffB8B8B8)),
                    prefixIcon: Image.asset(
                        'assets/leading icon.png'), // Icon on the left side of the text field
                  ),
                ),
              MaterialButton(
      // color: Colors.pink[50],
      onPressed: ()async{
    name =nameController.text;
    newtask.add(name);
    await saveData();
    setState(() {
      
    });

    },child: const Text('create',style: TextStyle(color: Colors.blue),),),],
            ),
          ),
         
        );
      },
    );
 }
 
  void initState() {
   loadData();
    super.initState();}
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(20, 50), child: AppBarWidget()),
      // backgroundColor: Colors.amber,
      // body: SafeArea(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome, ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const Text('John',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                  const Text('.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const SizedBox(
                    width: 140,
                  ),
                  IconButton(onPressed: () {   Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeletPage(
                
              ),
            ));},
                  icon: Image.asset('assets/tabler_dots.png')),
                ],
              ),
              const Text('You’ve got 8 tasks to do.'),

              Stack(
                children:[
               const SizedBox(
                height: 560,
                  child: ListWidget(),
                ),
                Positioned(
                  bottom: 70,
                  right: 20,
                  child: IconButton(onPressed: (){
                     _showBottomSheet(context);
                  },icon: Image.asset('assets/Vector.png')))
                ]
              ),
              // BottomSheet(onClosing: (){}, builder: )
            ],
          ),
        ),
      ),
    );
  }
}


class ListWidget extends StatelessWidget {
  const ListWidget({
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
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffF5F7F9),
          ),
          child:ListTile(
           
            leading:
              IconButton(onPressed: () {  },
              icon: 
              Image.asset('assets/Rectangle 2.png')),
              title: 
               Text(tasks[index]),
              
          
          ),
        );
      },
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const Text(
          'John',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xff3F3D56)),
        ),
        const SizedBox(
          width: 18,
        ),
        Image.asset('assets/avatar.png'),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
