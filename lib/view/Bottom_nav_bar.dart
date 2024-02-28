import 'package:flutter/material.dart';
import 'package:start2/view/CompletedScreen.dart';
import 'package:start2/view/TodoScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 int selectedIndex = 0;
  List screen = [
     TodoScreen(),
     CompletedScreen(),
    // ChallengeesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:const Color(0xff007FFF),
        unselectedItemColor: Color(0xffC6CFDC),
        onTap: (indexOnTap) {
          print(indexOnTap);
          selectedIndex = indexOnTap;
          setState(() {});
        },
        currentIndex: selectedIndex,
        items: const [

      BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: "Todo",), 
      BottomNavigationBarItem(icon: Icon(Icons.keyboard_arrow_right_outlined), label: "Completed"),
    ],
      
    ),);
  }
}