

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/cubit/task_cubit/task_state.dart';
import 'package:todo/models/task_models.dart';

import '../../constants/constants.dart';

class TaskCubit extends Cubit<TaskStates>{
  TaskCubit() : super(TaskInitialState());
  List<TaskModel> ? tasks;
 fetchAllTasks()
 {

     emit(TaskLoadingState());
     var taskBox =  Hive.box<TaskModel>(kTasksBox);
     tasks = taskBox.values.toList();
     emit(TaskSucessState());




 }
}