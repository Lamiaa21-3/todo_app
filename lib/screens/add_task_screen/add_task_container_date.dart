import 'package:flutter/material.dart';
class AddTaskContainerDate extends StatelessWidget {
  const AddTaskContainerDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
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
    );
  }
}
