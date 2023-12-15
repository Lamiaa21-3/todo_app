

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/cubit/add_task_cubit/add_task_states.dart';
import 'package:todo/models/task_models.dart';

class AddTaskCubit extends Cubit<AddTaskStates>{
  AddTaskCubit() : super (AddTaskInitialState());


  addTask(TaskModel taskModel) async 
  {
    try {
      emit(AddTaskLoadingState());
      var taskBox =  Hive.box<TaskModel>(kTasksBox);
       await taskBox.add(taskModel);
       emit(AddTaskSuccessState());
    } on Exception catch (e) {
     print(e);
     emit(AddTaskFailureState(e.toString()));
    }

  }


}









