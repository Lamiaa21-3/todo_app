import 'package:flutter/material.dart';

class ColorIetm extends StatelessWidget {
  const ColorIetm(
      {Key? key,
      required this.colorActive,
      required this.color,
      required this.isActive})
      : super(key: key);
  final bool colorActive;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive ? CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 28,
      ),
    ):
    CircleAvatar(
      backgroundColor: color,
      radius: 30,
    );
  }
}
