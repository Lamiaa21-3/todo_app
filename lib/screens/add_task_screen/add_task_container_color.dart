import 'package:flutter/material.dart';

class AddTaskContainerColor extends StatelessWidget {
  AddTaskContainerColor({Key? key, required this.color, required this.iconData})
      : super(key: key);
  final Color color;
  final IconData ?iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(iconData),
      height: 36,
      width: 36,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
