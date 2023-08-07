part of 'priority_task_details_bloc.dart';

class PriorityTaskDetailsEvent extends Equatable {
  const PriorityTaskDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitPriorityTaskDetailsEvent extends PriorityTaskDetailsEvent {
  final String taskId;
  const InitPriorityTaskDetailsEvent(this.taskId);
  @override
  List<Object> get props => [taskId];
}

class OnChangeTimeEvent extends PriorityTaskDetailsEvent {
  final int second;
  const OnChangeTimeEvent(this.second);

  @override
  List<Object> get props => [second];
}

class OnCompleteOrNotTodoEvent extends PriorityTaskDetailsEvent {
  final TodoModel todoModel;
  final int index;
  final bool isCompleted;
  const OnCompleteOrNotTodoEvent(this.todoModel, this.isCompleted, this.index);

  @override
  List<Object> get props => [todoModel, isCompleted];
}
