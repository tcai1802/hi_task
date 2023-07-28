part of 'add_task_bloc.dart';

abstract class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

class OnChangeTaskTypeEvent extends AddTaskEvent {
  final TaskTypeEnum taskType;
  const OnChangeTaskTypeEvent(this.taskType);

  @override
  List<Object> get props => [taskType];
}

class OnChangeStartTimeEvent extends AddTaskEvent {
  final DateTime startTime;
  const OnChangeStartTimeEvent(this.startTime);

  @override
  List<Object> get props => [startTime];
}

class OnChangeEndTimeEvent extends AddTaskEvent {
  final DateTime endTime;
  const OnChangeEndTimeEvent(this.endTime);

  @override
  List<Object> get props => [endTime];
}

class OnAddTodoEvent extends AddTaskEvent {
  final TodoModel todoModel;
  const OnAddTodoEvent(this.todoModel);

  @override
  List<Object> get props => [todoModel];
}

class OnEditTodoEvent extends AddTaskEvent {
  final TodoModel todoModel;
  final int index;
  const OnEditTodoEvent(this.todoModel, this.index);

  @override
  List<Object> get props => [todoModel];
}

class OnDelTodoEvent extends AddTaskEvent {
  final int index;
  const OnDelTodoEvent(this.index);

  @override
  List<Object> get props => [index];
}

class OnSubmitTaskEvent extends AddTaskEvent {
  final TaskModel taskModel;
  const OnSubmitTaskEvent(this.taskModel);

  @override
  List<Object> get props => [taskModel];
}
