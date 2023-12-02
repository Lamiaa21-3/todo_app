import 'package:flutter/material.dart';

import '../screens/add_task_screen/add_task_screen.dart';


class FloatingActionButtonIetm extends StatelessWidget {
   FloatingActionButtonIetm({Key? key, required this.onPressFunction}) : super(key: key);
final void Function()? onPressFunction;
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
    backgroundColor: Color(0xFF8687E7),
    onPressed: onPressFunction,
    child: Icon(
    Icons.add,
    color: Colors.white,
    ),
    );
  }
}
