import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/components/min_text.dart';
import 'package:todo/components/text_small.dart';
import 'package:todo/screens/add_task_screen/add_task_screen.dart';


import '../../components/floatingActionButtonIetm.dart';
import '../../components/text_main.dart';
import '../../cubit/task_cubit/task_cubit.dart';
import '../../cubit/task_cubit/task_state.dart';
import '../../models/task_models.dart';
import '../create_task/container_ietm.dart';

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
      body:  BlocBuilder<TaskCubit,TaskStates>(

        builder: (context,state){
          BlocProvider.of<TaskCubit>(context).fetchAllTasks();
          List<TaskModel> tasksList = BlocProvider.of<TaskCubit>(context).tasks?? [];
          return tasksList.isEmpty ?
          Padding(
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
          ):Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated (
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:tasksList.length,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ContainerIetm(taskModel: tasksList[index],);
              },
            ),
          );
        }

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
