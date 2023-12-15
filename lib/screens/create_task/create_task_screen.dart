import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/floatingActionButtonIetm.dart';
import 'package:todo/components/text_middle.dart';
import 'package:todo/components/text_small.dart';
import 'package:todo/components/text_main.dart';
import 'package:todo/cubit/task_cubit/task_cubit.dart';
import 'package:todo/cubit/task_cubit/task_state.dart';
import 'package:todo/models/task_models.dart';

import '../create_task_details/create_task_details.dart';
import 'container_ietm.dart';

class CreateTaskScreen extends StatefulWidget {
  CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {



@override
  void initState() {
    // TODO: implement initState
  BlocProvider.of<TaskCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: BlocBuilder<TaskCubit,TaskStates>(
        builder: (context,state){
          List<TaskModel> tasksList = BlocProvider.of<TaskCubit>(context).tasks?? [];
          return Padding(
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
                    itemCount:tasksList!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ContainerIetm(mainText: 'title', subText: '', color: Colors.amber,);
                    },
                  ),
                ],
              ),
            ),
          );
        },

      ),
      // floatingActionButton: FloatingActionButtonIetm(
      //   onPressFunction: () {
      //     addTasks(title: 'Task3', time: '2222222222222', taskName: 'taskName');
      //   },
      // ),
    );
  }
}
