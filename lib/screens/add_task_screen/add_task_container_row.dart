import 'package:flutter/material.dart';

class AddTaskContainerRow extends StatefulWidget {
  const AddTaskContainerRow({Key? key}) : super(key: key);

  @override
  State<AddTaskContainerRow> createState() => _AddTaskContainerRowState();
}

class _AddTaskContainerRowState extends State<AddTaskContainerRow> {
  TimeOfDay dateTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
             '${dateTime.hour} : ${dateTime.minute}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                  fontSize: 16),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              showTimeAndDatePicker(context);
            },
            icon: Icon(Icons.timer_outlined),
          ),
        ],
      ),
      width: 150,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
    );
  }

  void showTimeAndDatePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        dateTime = value! ;
      });
    });
  }
}
