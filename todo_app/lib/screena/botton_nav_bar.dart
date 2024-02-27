import 'package:flutter/material.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/screena/complete_task_screen.dart';
import 'package:todo_app/screena/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentScreen = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CompleteScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: blue,
            unselectedItemColor: navBarGrey,
            selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            iconSize: 30,
                        type: BottomNavigationBarType.fixed,

      
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.checklist_rounded),
          label: "Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.check),
          label: "Completed"),
        ],
        currentIndex: currentScreen,
        onTap: (int index){
          currentScreen = index;
          setState(() {
            
          });
        },
      ),
    ) ;
  }
}