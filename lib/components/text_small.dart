import 'package:flutter/material.dart';
class TextDate extends StatelessWidget {
   TextDate({Key? key, required this.text}) : super(key: key);

   final String text;

  @override
  Widget build(BuildContext context) {
    return   Text(
      '$text',
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: 'Lato',
          fontSize: 16),
    );
  }
}
