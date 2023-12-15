import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/cubit/add_task_cubit/add_task_states.dart';

import '../../cubit/add_task_cubit/add_task_cubit.dart';
import '../../models/task_models.dart';
import '../create_task/create_task_screen.dart';
import 'add_task_component.dart';
import 'add_task_container_color.dart';
import 'add_task_container_date.dart';
import 'add_task_container_row.dart';
import 'add_task_text.dart';
class FormIetmScreen extends StatefulWidget {
  const FormIetmScreen({Key? key}) : super(key: key);

  @override
  State<FormIetmScreen> createState() => _FormIetmScreenState();
}

class _FormIetmScreenState extends State<FormIetmScreen> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitile;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit,AddTaskStates>(
      listener: (context, state) {
        if(state is AddTaskFailureState)
        {
          print('Failure ${state.errorMessage}');
        }
        if(state is AddTaskSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTaskScreen()));

        }
      },
      builder:  (context, state) {
        return Form(
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
                //controller: titleController,
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
                // controller: taskController,
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
                        var currentDate = DateTime.now();
                        var formatedDate = DateFormat.yMd().format(currentDate);
                        var  taskModel = TaskModel(title: title!,
                            subTitle: subTitile!,
                            date: formatedDate,
                            color: Colors.blue.value);
                        BlocProvider.of<AddTaskCubit>(context)
                            .addTask(taskModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {

                        });
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
        );
      },

    );
  }
}
