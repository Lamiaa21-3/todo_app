import 'package:flutter/material.dart';
import 'package:todo/screens/create_task_details/container_ietm_column.dart';

import '../../components/text_main.dart';
import '../../components/text_middle.dart';
import '../create_task/container_ietm.dart';

class CreateTaskDetailsScreen extends StatelessWidget {
  const CreateTaskDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(
           padding: const EdgeInsets.only(left: 25, top: 40),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               TextMain(string: 'October 2,2023',),
               TextMiddle(text: 'Today',),
               ContainerIetm(
                 mainText: 'Task 1',
                 subText: 'Learn Dart',
                 color: Color(0xFFFF4666),
               ),
               // SizedBox(
               //   height: 30,
               // ),
               ContainerIetm(
                 mainText: 'Task 2',
                 subText: 'Learn SQFLITE ',
                 color: Color(0xFFCC8441),
               ),
               Container(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 20),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                     ContainerIetmColumn(text: 'Task Completed ', color:  Color(0xFF8875FF),onTapContaoner: (){},),
                       ContainerIetmColumn(text: 'Delete Task', color:  Color(0xFFE57373),onTapContaoner: (){}),
                       ContainerIetmColumn(text: 'Cancel ', color:  Color(0xFF8875FF),onTapContaoner: (){
                         Navigator.pop(context);
                       }),
                     ],
                   ),
                 ),
                 width: 375,
                 height: 240,
                 decoration: BoxDecoration(
                   color: Color(0xFF424242)
                 ),
               ),
             ],
           ),
         ),
    );
  }
}
