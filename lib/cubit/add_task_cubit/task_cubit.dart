

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/add_task_cubit/task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates>{
  AddTaskCubit() : super (AddTaskInitialState());

}