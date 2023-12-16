
import 'package:flutter/material.dart';

class ColorIetm extends StatelessWidget {
  const ColorIetm({Key? key, required this.colorActive, required this.color}) : super(key: key);
  final bool colorActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,

      radius: 22,

    );
  }
}
