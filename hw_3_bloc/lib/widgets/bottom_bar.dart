import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hw_3_bloc/constant/colors.dart';
import 'package:hw_3_bloc/views/complete_view.dart';
import 'package:hw_3_bloc/views/to_do_view.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
   const ToDoPage(),
   CompleteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorPage,
        selectedItemColor: colorIcon,
        // Set the current index to highlight the active tab
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            // Define the active and inactive icons for the first tab
            activeIcon: SvgPicture.asset('assets/icon/todo-svgrepo-com 1.svg', color: colorIcon,),
            icon: SvgPicture.asset('assets/icon/todo-svgrepo-com 1.svg'),
           backgroundColor: colorPage,
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
            // Define the active and inactive icons for the second tab
            activeIcon: SvgPicture.asset('assets/icon/Plus.svg', color: colorIcon,),
            backgroundColor: colorPage,
            icon: SvgPicture.asset('assets/icon/Plus.svg'),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
