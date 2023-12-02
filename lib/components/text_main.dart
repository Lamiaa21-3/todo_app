import 'package:flutter/material.dart';
class TextMain extends StatelessWidget {
  TextMain({Key? key, required this.string}) : super(key: key);
   final String string;

  @override
  Widget build(BuildContext context) {
    return   Text(
      '$string',
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: 'Lato',
          fontSize: 24),
    );
  }
}
