import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo/cubit/add_task_cubit/task_cubit.dart';
import 'package:todo/cubit/add_task_cubit/task_states.dart';

import '../create_task/create_task_screen.dart';
import 'add_task_component.dart';
import 'add_task_container_color.dart';
import 'add_task_container_date.dart';
import 'add_task_container_row.dart';
import 'add_task_text.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();

  final timeController = TextEditingController();

  final taskController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final taskRef = Hive.box('Tasks');

  void addTasks({required String title, required String taskName}) async {
    await taskRef.add({
      'title': title,
      'taskName': taskName,
    });
    getTask();
  }

  List<Map<String, dynamic>> taskDate = [];

  void getTask() {
    setState(() {
      taskDate = taskRef.keys.map((e) {
        final currentTask = taskRef.get(e);
        return {
          'key': e,
          'title': currentTask['title'],
          'time': currentTask['time'],
          'taskName': currentTask['taskName'],
        };
      }).toList();
      debugPrint('llllllll${taskDate.length}');
    });
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitile;

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AddTaskCubit, AddTaskStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is AddTaskLoadingState ? true : false,
                  child: Form(
                    autovalidateMode: autovalidateMode,
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddTaskText(
                          text: 'Title',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldComponent(
                          onSaved: (value) {
                            title = value;
                          },
                          label: 'Enter title here',
                          controller: titleController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AddTaskText(
                          text: 'Note',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldComponent(
                          onSaved: (value) {
                            subTitile = value;
                          },
                          controller: taskController,
                          label: 'Enter note here',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AddTaskText(
                          text: 'Date',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AddTaskContainerDate(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AddTaskText(
                              text: 'Start Time',
                            ),
                            SizedBox(
                              width: 187,
                            ),
                            AddTaskText(
                              text: 'End Time',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            AddTaskContainerRow(),
                            Spacer(),
                            AddTaskContainerRow(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AddTaskText(
                          text: 'Color',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AddTaskContainerColor(
                              color: Color(0xFFFF4666),
                              iconData: Icons.check,
                            ),
                            AddTaskContainerColor(
                              color: Color(0xFF66CC41),
                              iconData: null,
                            ),
                            AddTaskContainerColor(
                              color: Color(0xFF41CCA7),
                              iconData: null,
                            ),
                            AddTaskContainerColor(
                              color: Color(0xFF4181CC),
                              iconData: null,
                            ),
                            AddTaskContainerColor(
                              color: Color(0xFFCC8441),
                              iconData: null,
                            ),
                            AddTaskContainerColor(
                              color: Color(0xFF9741CC),
                              iconData: null,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                              child: AddTaskText(
                                text: 'Create task',
                              ),
                              color: Color(0xFF8875FF),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));


              
            },

          ),
        ),
      ),
    );
  }
}
