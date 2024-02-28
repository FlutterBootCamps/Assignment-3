import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/pages/complete_task_page.dart';
import 'package:todo_list/pages/todo_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  List<Widget> _pages = [ToDoPage(), CompletePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: whiteColor,
            unselectedItemColor: greyColor,
            selectedItemColor: blueColor,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/todo.svg',
                  color: greyColor,
                ),
                activeIcon: Container(
                    padding: EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      'assets/images/todo.svg',
                    )),
                label: 'Todo',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/Tick.svg'),
                activeIcon: Container(
                    padding: EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      'assets/images/Tick.svg',
                      color: blueColor,
                    )),
                label: 'Completed',
              ),
            ]),
      ),
    );
  }
}
