import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/components/min_text.dart';
import 'package:todo/screens/home_page_screen/home_page_screen.dart';

import 'onBoarding_ietm.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(this.image, this.title, this.body);
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingList = [
    BoardingModel('assets/Frame 161.png', 'Manage your tasks',
        'You can easily manage all of your daily tasks in DoMe for free',),
    BoardingModel('assets/Frame 162.png', 'Create daily routine',
        'In Uptodo  you can create your personalized routine to stay productive'),
    BoardingModel('assets/Group 182.png', 'Organaize your tasks',
        'You can organize your daily tasks by adding your tasks into separate categories')
  ];

  var boardingController = PageController();

  bool isLast = false;
  String string = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));
            }, child: MinText(minString: 'Skip', color: Colors.grey,),),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boardingList.length - 1) {
                    setState(() {
                      isLast = true;
                      string = 'back';
                    });
                    print('the last');
                  } else if (index == boardingList.length - 2) {
                    string = 'back';
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print('not last');
                  }
                },
                controller: boardingController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return OnBoardingIetm(model : boardingList[index]);
                },
                itemCount: boardingList.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  string != ''
                      ? TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            'back',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'lato'),
                          ))
                      : Text(''),
               Spacer(),
                     MaterialButton(onPressed: (){
    if (isLast) {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePageScreen()));
          });
        } else {
          boardingController.nextPage(
              duration: Duration(milliseconds: 750),
              curve: Curves.fastLinearToSlowEaseIn);
        }
                     },child: MinText(minString: 'Next',color: Colors.white,),
                       color: Color(0xFF8875FF),
                     )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
