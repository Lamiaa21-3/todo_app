abstract class AddTaskStates {}
class AddTaskInitialState extends AddTaskStates{}
class AddTaskLoadingState extends AddTaskStates{}
class AddTaskSuccessState extends AddTaskStates{}
class AddTaskFailureState extends AddTaskStates{
  final String errorMessage ;

  AddTaskFailureState(this.errorMessage);

}







