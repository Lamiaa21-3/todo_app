import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/floatingActionButtonIetm.dart';
import 'package:todo/components/text_middle.dart';
import 'package:todo/components/text_small.dart';
import 'package:todo/components/text_main.dart';

import '../create_task_details/create_task_details.dart';
import 'container_ietm.dart';

class CreateTaskScreen extends StatefulWidget {
  CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {

  // List<Map<String, dynamic>> taskDate = [];
  // bool bottomOpened = false;
  //
  // final taskRef = Hive.box('Tasks');
  //
  // void addTasks({required String title,
  //   required String time,
  //   required String taskName}) async {
  //   await taskRef.add({
  //     'title': title,
  //     'time': time,
  //     'taskName': taskName,
  //   });
  //   getTask();
  // }
  //
  // void getTask() {
  //   setState(() {
  //     taskDate = taskRef.keys.map((e) {
  //       final currentTask = taskRef.get(e);
  //       return {
  //         'key': e,
  //         'title': currentTask['title'],
  //         'time': currentTask['time'],
  //         'taskName': currentTask['taskName'],
  //       };
  //     }).toList();
  //     debugPrint('llllllll${taskDate.length}');
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getTask();
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF8687E7),
      //   onPressed: () {
      //
      //   },
      //   child: Icon(bottomOpened ? Icons.clear : Icons.add),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
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
              TextMain(
                string: 'Today',
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:12,
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ContainerIetm(mainText: 'title', subText: '', color: Colors.amber,);
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButtonIetm(
      //   onPressFunction: () {
      //     addTasks(title: 'Task3', time: '2222222222222', taskName: 'taskName');
      //   },
      // ),
    );
  }
}
