import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:todo/cubit/add_task_cubit/add_task_states.dart';
import 'package:todo/models/task_models.dart';

import '../create_task/create_task_screen.dart';
import 'add_task_component.dart';
import 'add_task_container_color.dart';
import 'add_task_container_date.dart';
import 'add_task_container_row.dart';
import 'add_task_text.dart';
import 'form_ietm_screen.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  // final titleController = TextEditingController();
  //
  // final timeController = TextEditingController();
  //
  // final taskController = TextEditingController();
  //


  //final taskRef = Hive.box('Tasks');

  // void addTasks({required String title, required String taskName}) async {
  //   await taskRef.add({
  //     'title': title,
  //     'taskName': taskName,
  //   });
  //   getTask();
  // }

  // List<Map<String, dynamic>> taskDate = [];
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
  //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Add Task',
            style: TextStyle(
                fontFamily: 'Lato', fontSize: 32, fontWeight: FontWeight.w700)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:
         ModalProgressHUD(
              inAsyncCall:  false ,
              child: SingleChildScrollView(
                child: FormIetmScreen(),
              )

      ),
    );
  }
}
