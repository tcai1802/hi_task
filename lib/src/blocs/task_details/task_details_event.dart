part of 'task_details_bloc.dart';

class TaskDetailsEvent extends Equatable {
  const TaskDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitTaskDetailsEvent extends TaskDetailsEvent {
  final String taskId;
  const InitTaskDetailsEvent(this.taskId);
  @override
  List<Object> get props => [taskId];
}

class OnChangeTimeEvent extends TaskDetailsEvent {
  final int second;
  const OnChangeTimeEvent(this.second);

  @override
  List<Object> get props => [second];
}

class OnCompleteOrNotTodoEvent extends TaskDetailsEvent {
  final TodoModel todoModel;
  final int index;
  final bool isCompleted;
  const OnCompleteOrNotTodoEvent(this.todoModel, this.isCompleted, this.index);

  @override
  List<Object> get props => [todoModel, isCompleted];
}

class SubmitFinishTask extends TaskDetailsEvent {
  final bool isCompleted;

  const SubmitFinishTask(this.isCompleted);

  @override
  List<Object> get props => [isCompleted];
}
