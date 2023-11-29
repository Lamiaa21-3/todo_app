import 'package:flutter/material.dart';

class AddTaskContainerRow extends StatelessWidget {
  const AddTaskContainerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Text(
              '09:33 PM',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                  fontSize: 16),
            ),
          ),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.timer_outlined),),
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
}
