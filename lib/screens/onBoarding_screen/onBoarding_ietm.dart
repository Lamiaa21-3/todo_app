import 'package:flutter/material.dart';

import 'onBoarding_screen.dart';

class OnBoardingIetm extends StatelessWidget {
   OnBoardingIetm({Key? key, required this.model}) : super(key: key);
   final BoardingModel model;

  @override
  Widget build(BuildContext context) {
    return   Column  (

        children: [
          Image.asset('${model.image}'),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
                fontFamily: 'Lato', fontSize: 32, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
            maxLines: 2,
            overflow: TextOverflow.visible,
          ),

        ],
      );

  }
}
