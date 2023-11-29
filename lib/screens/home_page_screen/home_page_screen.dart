import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/screens/add_task_screen/add_task_screen.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'October 2,2023',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Lato',
                  fontSize: 16),
            ),
            Text(
              'Today',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Lato',
                  fontSize: 16),
            ),
            TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 12),
              lastDay: DateTime.utc(2030, 3, 21),
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
            Padding(
              padding: const EdgeInsets.only(left: 99),
              child: Text(
                'Tap + to add your tasks',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8687E7),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
