import 'package:flutter/material.dart';

class ContainerIetmColumn extends StatelessWidget {
   ContainerIetmColumn({Key? key, required this.text, required this.color, this.onTapContaoner}) : super(key: key);
 final String text;
 final Color color;
 final void Function()? onTapContaoner;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTapContaoner ,
      child: Container(
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato',
                fontSize: 16),
          ),
        ),
        width: 327,
        height: 47,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(8),
        ),

      ),
    );
  }
}
