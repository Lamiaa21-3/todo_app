import 'package:flutter/material.dart';

import '../../components/text_main.dart';
import '../../components/text_middle.dart';
import '../../components/text_small.dart';


class ContainerIetm extends StatelessWidget {
   ContainerIetm({Key? key, required this.mainText, required this.subText, required this.color}) : super(key: key);
   final String mainText;
   final String subText;
   final Color color;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMain(
                string: '$mainText',
              ),
              Row(
                children: [
                  Icon(Icons.timer_outlined),
                  SizedBox(
                    width: 9,
                  ),
                  TextDate(
                    text: '09:33 PM - 09:48 PM',
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    width: 2,
                    height: 60,
                    color: Color(0xFFC4C4C4),
                  ),
                  SizedBox(width: 3,),
                  new RotatedBox(
                      quarterTurns: 3,
                      child: new   Text(
                        'TODO',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                            fontSize: 16),
                      )
                  )
                ],
              ),
              TextMiddle(text: '$subText'),
            ]),
      ),
      width: 375,
      height: 128,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
