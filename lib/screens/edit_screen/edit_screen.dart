import 'package:flutter/material.dart';
import 'package:todo/models/task_models.dart';

import '../add_task_screen/add_task_component.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? editTitle, editSubTitile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Edit Screen '),
          actions: [
            IconButton(
              onPressed: () {
                widget.taskModel.title = editTitle ?? widget.taskModel.title;
                widget.taskModel.subTitle =
                    editSubTitile ?? widget.taskModel.subTitle;
                widget.taskModel.save();
                Navigator.pop(context);
              },
              icon: Icon(Icons.check),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Column(
          children: [
            TextFormFieldComponent(
              onChanged: (value) {
                editTitle = value;
              },

              // controller: taskController,
              label: '${widget.taskModel.title}',
            ),
            SizedBox(
              height: 20,
            ),
            TextFormFieldComponent(
              onChanged: (value) {
                editSubTitile = value;
              },

              // controller: taskController,
              label: '${widget.taskModel.subTitle}',
            ),
          ],
        ),
      ),
    );
  }
}
