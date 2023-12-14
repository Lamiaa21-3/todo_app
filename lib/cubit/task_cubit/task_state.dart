import 'package:todo/models/task_models.dart';

abstract class TaskStates {}
class TaskInitialState extends TaskStates{}
class TaskLoadingState extends TaskStates{}
class TaskFailureState extends TaskStates{
  final String erroeMessage;

  TaskFailureState(this.erroeMessage);
}
class TaskSucessState extends TaskStates{
 final List<TaskModel> tasks;

  TaskSucessState(this.tasks);
}