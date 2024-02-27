import 'package:assignment3/nav_sccreens/completedpage.dart';
import 'package:assignment3/nav_sccreens/todo_page.dart';
import 'package:flutter/material.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key}); // Constructor

  @override
  // ignore: library_private_types_in_public_api
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int _selectedIndex = 0; // Index of the selected bottom navigation bar item

  final List<Widget> _pages = [
    TodoPage(), // Page for Todo tasks
    CompletedPage(), // Page for completed tasks
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // User name displayed on the app bar
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("John",style: TextStyle(color: Color(0xff3f3d56),fontWeight: FontWeight.bold),),
          ),
          SizedBox(width: 9), // Empty space
          Padding(
            padding: EdgeInsets.only(right: 20,top: 20),
            child: CircleAvatar(child: Image.asset("images/avatar.png"),), // User avatar
          ),
        ],
      ),
      body: _pages.elementAt(_selectedIndex), // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed type for consistent appearance
        backgroundColor: Colors.white, // Background color of the bottom navigation bar
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset("images/todo.png"), // Icon for Todo when selected
            icon: Image.asset("images/todo1.png"), // Icon for Todo when not selected
            label: 'Todo', // Label for Todo
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check), // Icon for Completed
            label: 'Complete', // Label for Completed
          ),
        ],
        currentIndex: _selectedIndex, // Current selected index
        selectedItemColor: Color(0xff007fff), // Color for selected item

        unselectedItemColor: Color(0xff595959), // Color for unselected items
        onTap: _onItemTapped, // Callback when an item is tapped
      ),
    );
  }
}
