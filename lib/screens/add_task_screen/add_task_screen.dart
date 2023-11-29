import 'package:flutter/material.dart';

import 'add_task_component.dart';
import 'add_task_container_color.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTaskText(
                text: 'Title',
              ),
              TextFormFieldComponent(
                label: 'Enter title here',
              ),
              AddTaskText(
                text: 'Note',
              ),
              TextFormFieldComponent(
                label: 'Enter note here',
              ),
              AddTaskText(
                text: 'Date',
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '9/7/2023',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                            fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.date_range),
                    ),
                  ],
                ),
                width: 400,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
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
              Row(
                children: [
                  AddTaskContainerRow(),
                  Spacer(),
                  AddTaskContainerRow(),
                ],
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
                    onPressed: () {},
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
