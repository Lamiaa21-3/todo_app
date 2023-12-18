import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/task_models.dart';

import '../../components/text_main.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_state.dart';
import 'container_ietm.dart';

class CreateTaskScreen extends StatefulWidget {
  CreateTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  DateTime _selectedValue = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskStates>(
        builder: (context, state) {
          BlocProvider.of<TaskCubit>(context).fetchAllTasks();
          List<TaskModel> tasksList =
              BlocProvider.of<TaskCubit>(context).tasks ?? [];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
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
                  Container(
                    width: double.infinity,
                    height: 90,
                    child: DatePicker(
                      DateTime.now(),
                      dayTextStyle: TextStyle(color: Colors.white),
                      monthTextStyle: TextStyle(color: Colors.white,),

                      dateTextStyle: TextStyle(color: Colors.white,),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Color(0xFF242969),
                      selectedTextColor: Colors.white,
                      deactivatedColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tasksList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ContainerIetm(
                        taskModel: tasksList[index],
                      );
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
