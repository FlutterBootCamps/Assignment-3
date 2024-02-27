import 'package:assignment_3/view/completed_task_screen.dart';
import 'package:assignment_3/view/home_screen.dart';
import 'package:assignment_3/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const CompletedTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserInfo()],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          unselectedFontSize: 16,
          selectedFontSize: 16,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          unselectedItemColor: const Color(0xffC6CFDC),
          selectedItemColor: const Color(0xff007FFF),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Vector.svg"),
                label: 'Todo'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.check), label: 'Completed'),
          ]),
    );
  }
}
