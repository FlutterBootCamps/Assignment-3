
import 'package:flutter/material.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

extension Screen on BuildContext {

  getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  push(BuildContext context, Widget view){
    return Navigator.push(context, MaterialPageRoute(builder: (route) => view));
  }
  showSuccessSnackBar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg, style: const TextStyle(color: whiteColor, fontFamily: urbanistFont,),), backgroundColor: oceanBlueColor,));
  }
  showErrorSnackBar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg, style: const TextStyle(color: whiteColor, fontFamily: urbanistFont,),), backgroundColor: redColor,));
  }
}