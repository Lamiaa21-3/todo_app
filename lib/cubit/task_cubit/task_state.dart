import 'package:todo/models/task_models.dart';

abstract class TaskStates {}
class TaskInitialState extends TaskStates{}
class TaskLoadingState extends TaskStates{}
