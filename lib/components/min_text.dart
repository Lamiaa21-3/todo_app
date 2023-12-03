import 'package:flutter/material.dart';

class MinText extends StatelessWidget {
   MinText({Key? key, required this.minString, required this.color}) : super(key: key);
   final String minString;
   final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$minString',
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato',
        fontSize: 16,
        color: color,
      ),
    );
  }
}
