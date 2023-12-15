import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo/components/min_text.dart';
import 'package:todo/components/text_small.dart';
import 'package:todo/screens/add_task_screen/add_task_screen.dart';


import '../../components/floatingActionButtonIetm.dart';
import '../../components/text_main.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextMain(
                  string: 'October 2,2023',
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextDate(
              text: 'Today',
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // DatePicker(
                //   DateTime.now(),
                //   height: 90,
                //   initialSelectedDate: DateTime.now(),
                //   selectionColor: Color(0xFF242969),
                //   selectedTextColor: Colors.white,
                //   monthTextStyle: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       fontFamily: 'Lato'),
                //   dayTextStyle: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       fontFamily: 'Lato'),
                //   dateTextStyle: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       fontFamily: 'Lato'),
                //   onDateChange: (date) {
                //     // New date selected
                //     setState(() {
                //       _selectedValue = date;
                //     });
                //   },
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Image.asset('assets/Checklist-rafiki 1.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                'What do you want to do today?',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 99),
              child: MinText(
                minString: 'Tap + to add your tasks',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonIetm(
        onPressFunction: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()));
        },
      ),
    );
  }
}
