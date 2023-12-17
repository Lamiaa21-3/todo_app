import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskContainerDate extends StatefulWidget {
  AddTaskContainerDate({Key? key}) : super(key: key);

  @override
  State<AddTaskContainerDate> createState() => _AddTaskContainerDateState();
}

class _AddTaskContainerDateState extends State<AddTaskContainerDate> {
  List<DateTime?> _dates = [];

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              DateFormat.yMEd()

              // displaying formatted date
                  .format(dateTime),
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                  fontSize: 16),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              showDatePicker(context: context,
                  initialDate:DateTime.now(),
                  firstDate:DateTime(2000),
                  lastDate:DateTime(2027),
              ).then((value){
               setState(() {
                 dateTime= value!;
               });
              });
            },
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
    );
  }
}
// var currentDate = DateTime.now();
// var formatedDate = DateFormat.yMd().format(currentDate);