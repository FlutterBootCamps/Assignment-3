import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_app/widgets/appbar.dart';
import 'package:to_do_app/widgets/custom_navigation_bar.dart';
import '/model/todo.dart';
import '/constants/colors.dart';
import '/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> foundToDo = [];
  final todoController = TextEditingController();
  bool showCompleted = false;

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
    loadTodos(); // Load todos on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                if (!showCompleted) // Render only if showCompleted is false
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Welcome, ',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(
                            text: 'John',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!showCompleted) // Render only if showCompleted is false
                  Text(
                    'You’ve got got ${foundToDo.length} task to do',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                Expanded(
                  child: ListView(
                    children: [
                      for (ToDo todo in foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: handleToDoChange,
                          onDeleteItem: deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      addToDoItem(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: Colors.white,
        unselectColor: const Color.fromARGB(255, 122, 118, 118),
        selectColor: const Color.fromARGB(255, 38, 118, 188),
        selectedTab: showCompleted ? 1 : 0,
        onTabSelected: (int index) {
          setState(() {
            showCompleted = index == 1;
            filterTodos();
          });
        },
      ),
    );
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
      filterTodos();
      saveTodos(); // Save todos after deletion
    });
  }

  void addToDoItem(String toDo) {
    setState(() {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      todosList.add(
        ToDo(
          id: id,
          todoText: toDo,
        ),
      );
      todoController.clear();
      filterTodos();
      saveTodos(); // Save todos after adding
    });
  }

  void filterTodos() {
    if (showCompleted) {
      setState(() {
        foundToDo = todosList.where((todo) => todo.isDone).toList();
      });
    } else {
      setState(() {
        foundToDo = todosList.where((todo) => !todo.isDone).toList();
      });
    }
  }

  void loadTodos() {
    final box = GetStorage();
    final List<dynamic>? storedTodos = box.read('todos');
    if (storedTodos != null) {
      todosList.clear();
      todosList.addAll(storedTodos.map((json) => ToDo.fromJson(json)).toList());
      filterTodos();
    }
  }

  void saveTodos() {
    final box = GetStorage();
    box.write('todos', todosList.map((todo) => todo.toJson()).toList());
  }
}
