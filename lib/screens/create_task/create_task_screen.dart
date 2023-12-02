import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/floatingActionButtonIetm.dart';
import 'package:todo/components/text_middle.dart';
import 'package:todo/components/text_small.dart';
import 'package:todo/components/text_main.dart';

import '../create_task_details/create_task_details.dart';
import 'container_ietm.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDate(
              text: 'October 2,2023',
            ),
            TextMain(
              string: 'Today',
            ),
            SizedBox(
              height: 30,
            ),
            ContainerIetm(
              mainText: 'Task 1',
              subText: 'Learn Dart',
              color: Color(0xFFFF4666),
            ),
            SizedBox(
              height: 30,
            ),
            ContainerIetm(
              mainText: 'Task 2',
              subText: 'Learn SQFLITE ',
              color: Color(0xFFCC8441),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonIetm(onPressFunction: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateTaskDetailsScreen()));
      },),
    );
  }
}
