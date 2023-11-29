import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/screens/home_page_screen/home_page_screen.dart';

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
        'You can easily manage all of your daily tasks in DoMe for free'),
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
      body: Column(
        children: [
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
                return buildColumnOnboarding(boardingList[index]);
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

                // SmoothPageIndicator(
                //     effect: const WormEffect(
                //       dotHeight: 16,
                //       dotWidth: 16,
                //       type: WormType.thinUnderground,
                //     ),
                //
                //     controller: boardingController,
                //     count: boardingList.length),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
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
                  },
                  child: Icon(Icons.arrow_forward_sharp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildColumnOnboarding(BoardingModel model) {
    return Column(
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
