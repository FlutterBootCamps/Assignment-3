import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: null,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/avatr.jpeg'),
        ),
      ),
    ],
  );
}
