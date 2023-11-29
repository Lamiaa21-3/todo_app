
import 'package:flutter/material.dart';
class AddTaskText extends StatelessWidget {
   AddTaskText({Key? key, required this.text}) : super(key: key);

   final String text;

  @override
  Widget build(BuildContext context) {
    return    Text('$text',style: TextStyle(
      fontFamily: 'Lato',
      fontSize: 16,
      fontWeight:FontWeight.w400 ,
    ),);
  }
}
