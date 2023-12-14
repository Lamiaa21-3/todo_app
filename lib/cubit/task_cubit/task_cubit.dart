

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/task_cubit/task_state.dart';

class TaskCubit extends Cubit<TaskStates>{
  TaskCubit() : super(TaskInitialState());

}