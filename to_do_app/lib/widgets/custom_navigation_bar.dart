import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Color backgroundColor;
  final Color unselectColor;
  final Color selectColor;
  final int selectedTab;
  final Function(int) onTabSelected;

  CustomBottomNavigationBar({
    required this.backgroundColor,
    required this.unselectColor,
    required this.selectColor,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      unselectedItemColor: unselectColor,
      selectedItemColor: selectColor,
      currentIndex: selectedTab,
      showUnselectedLabels: true,
      onTap: onTabSelected,
      items: <BottomNavigationBarItem>[
       BottomNavigationBarItem(
      icon: Image.asset('assets/images/menu.png', width: 24, height: 24), 
       label: "ToDo",
         ),

        BottomNavigationBarItem(
          icon: Icon(Icons.check), 
          label: "Completed",
        ), 

      ],
    );
  }
}
