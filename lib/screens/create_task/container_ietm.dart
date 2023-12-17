import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:todo/cubit/task_cubit/task_cubit.dart';

import '../../components/text_main.dart';
import '../../components/text_middle.dart';
import '../../components/text_small.dart';
import '../../models/task_models.dart';
import '../create_task_details/container_ietm_column.dart';

class ContainerIetm extends StatefulWidget {
  ContainerIetm({
    Key? key,
    required this.taskModel,
  }) : super(key: key);
  final TaskModel taskModel;

  @override
  State<ContainerIetm> createState() => _ContainerIetmState();
}

class _ContainerIetmState extends State<ContainerIetm> {
  // final String mainText;
  //bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: 375,
                height: 240,
                decoration: BoxDecoration(color: Color(0xFF424242)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerIetmColumn(
                      text: 'Task Completed ',
                      color: Color(0xFF8875FF),
                      onTapContaoner: () {
                      setState(() {
                        widget.taskModel.isCompleted = true;
                        widget.taskModel.save();
                        Navigator.pop(context);
                      });

                      },
                    ),
                    ContainerIetmColumn(
                        text: 'Delete Task',
                        color: Color(0xFFE57373),
                        onTapContaoner: () {

                          widget.taskModel.delete();
                          BlocProvider.of<TaskCubit>(context).fetchAllTasks();
                        }),
                    ContainerIetmColumn(
                        text: 'Cancel ',
                        color: Color(0xFF8875FF),
                        onTapContaoner: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              );
            });
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextMain(
              string: '${widget.taskModel.title}',
            ),
            Row(
              children: [
                Icon(Icons.timer_outlined),
                SizedBox(
                  width: 9,
                ),
                TextDate(
                  text: widget.taskModel.date,
                ),
                SizedBox(
                  width: 90,
                ),
                Container(
                  width: 2,
                  height: 60,
                  color: Color(0xFFC4C4C4),
                ),
                SizedBox(
                  width: 3,
                ),
                new RotatedBox(
                    quarterTurns: 3,
                    child: widget.taskModel.isCompleted?
                    Text(

                      'Completed',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato',
                          fontSize: 12),
                    ):
                    Text(

                      'TODO',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato',
                          fontSize: 16),
                    )

                )
              ],
            ),
            TextMiddle(text: '${widget.taskModel.subTitle}'),
          ]),
        ),
        width: 375,
        height: 128,
        decoration: BoxDecoration(
          color:Color(widget.taskModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
