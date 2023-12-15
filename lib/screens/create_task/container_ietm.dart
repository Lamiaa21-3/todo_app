import 'package:flutter/material.dart';

import '../../components/text_main.dart';
import '../../components/text_middle.dart';
import '../../components/text_small.dart';
import '../../models/task_models.dart';
import '../create_task_details/container_ietm_column.dart';


class ContainerIetm extends StatelessWidget {
   ContainerIetm({Key? key, required this.taskModel,}) : super(key: key);
   final TaskModel taskModel;
   // final String mainText;
  // final String subText;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return  Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerIetmColumn(text: 'Task Completed ', color:  Color(0xFF8875FF),onTapContaoner: (){

                    },),
                    ContainerIetmColumn(text: 'Delete Task', color:  Color(0xFFE57373),onTapContaoner: (){
                      taskModel.delete();
                    }),
                    ContainerIetmColumn(text: 'Cancel ', color:  Color(0xFF8875FF),onTapContaoner: (){
                      Navigator.pop(context);
                    }),
                  ],
                ),
                width: 375,
                height: 240,
                decoration: BoxDecoration(
                    color: Color(0xFF424242)
                ),
              );
            });
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8,top: 8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextMain(
                  string: '${taskModel.title}',
                ),
                Row(
                  children: [
                    Icon(Icons.timer_outlined),
                    SizedBox(
                      width: 9,
                    ),
                    TextDate(
                      text:taskModel.date,
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Container(
                      width: 2,
                      height: 60,
                      color: Color(0xFFC4C4C4),
                    ),
                    SizedBox(width: 3,),
                    new RotatedBox(
                        quarterTurns: 3,
                        child: new   Text(
                          'TODO',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lato',
                              fontSize: 16),
                        )
                    )
                  ],
                ),
                TextMiddle(text: '${taskModel.subTitle}'),
              ]),
        ),
        width: 375,
        height: 128,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
