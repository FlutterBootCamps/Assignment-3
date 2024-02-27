import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/pages/completid_task_page.dart';
import 'package:assignment_3/pages/to_do_page/to_do_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  PageController? controllerPageView = PageController();
  List<Widget> screens = [
    const ToDoTaskPage(),
    const CompletidTaskPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: blue,
          unselectedItemColor: check,
          onTap: (indexOnTap) {
            selectedIndex = indexOnTap;
            setState(() {});
          },
          enableFeedback: false,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/toDoIcon.svg",
                ),
                activeIcon: SvgPicture.asset(
                  "assets/toDoIcon.svg",
                  colorFilter: ColorFilter.mode(blue, BlendMode.srcIn),
                ),
                label: "Todo"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.check), label: "Completed"),
          ],
        ),
        body: screens[selectedIndex]);
  }
}
