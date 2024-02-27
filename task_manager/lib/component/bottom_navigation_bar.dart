import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/page/completed_page.dart';
import 'package:task_manager/const/const_color.dart';
import 'package:task_manager/page/home_page.dart';


class BottomNavigationBarState extends StatefulWidget {
  const BottomNavigationBarState({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const completedPage(),
  ];

  @override
  _BottomNavigationBarStateState createState() =>
      _BottomNavigationBarStateState();
}

class _BottomNavigationBarStateState extends State<BottomNavigationBarState> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomNavigationBarState._pages.elementAt(_selectedTab),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundColor,

            unselectedItemColor: unselectColor,
            selectedItemColor: selectColor,
            currentIndex: _selectedTab,
            
            showUnselectedLabels: true,
            onTap: (value) {
              setState(() {
                _selectedTab = value;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(color:0==_selectedTab ? selectColor :unselectColor ,
                    "assets/icon/todo-svgrepo-com 1.svg",
                    height: 24,
                    width: 24,
                  ),
                  label: "Todo"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.check),
                  label: "completed",),

            ]));
  }
}
