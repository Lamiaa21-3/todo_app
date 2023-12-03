import 'package:flutter/material.dart';

import '../create_task/create_task_screen.dart';
import 'add_task_component.dart';
import 'add_task_container_color.dart';
import 'add_task_container_date.dart';
import 'add_task_container_row.dart';
import 'add_task_text.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

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
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTaskText(
                text: 'Title',
              ),
              SizedBox(height: 10,),
              TextFormFieldComponent(
                label: 'Enter title here',
              ),
              SizedBox(height: 20,),
              AddTaskText(
                text: 'Note',
              ),
              SizedBox(height: 10,),
              TextFormFieldComponent(
                label: 'Enter note here',
              ),
              SizedBox(height: 20,),
              AddTaskText(
                text: 'Date',
              ),
              SizedBox(height: 10,),
              AddTaskContainerDate(),
              SizedBox(height: 20,),
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
              SizedBox(height: 10,),
              Row(
                children: [
                  AddTaskContainerRow(),
                  Spacer(),
                  AddTaskContainerRow(),
                ],
              ),
              SizedBox(height: 20,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTaskScreen()));
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
        ),
      ),
    );
  }
}
