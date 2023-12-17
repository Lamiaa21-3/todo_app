import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_task_cubit/add_task_cubit.dart';
import 'color_ietm.dart';


class ListViewIetm extends StatefulWidget {
  const ListViewIetm({Key? key}) : super(key: key);

  @override
  State<ListViewIetm> createState() => _ListViewIetmState();
}

class _ListViewIetmState extends State<ListViewIetm> {
  List<Color> colors = [
    Color(0xFFFF4666),
    Color(0xFF66CC41),
    Color(0xFF41CCA7),
    Color(0xFF4181CC),
    Color(0xFFCC8441),
    Color(0xFF9741CC),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                currentIndex= index;
                BlocProvider.of<AddTaskCubit>(context).color = colors[index];
                setState(() {

                });
                print('accccccccccctive');

              },
              child: ColorIetm(
                colorActive: currentIndex == index, color: colors[index],
              ),
            );
          }),
    );
  }
}