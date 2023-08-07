part of 'priority_task_details_bloc.dart';

class PriorityTaskDetailsState extends Equatable {
  final TaskModel? taskModel;
  final int seconds;
  final List<TodoModel> todoList;
  const PriorityTaskDetailsState({
    this.taskModel,
    this.seconds = 0,
    this.todoList = const <TodoModel>[],
  });

  PriorityTaskDetailsState copyWith({
    TaskModel? taskModel,
    int? seconds,
    List<TodoModel>? todoList,
    int? days,
    int? minutes,
    int? hours,
    int? second,
  }) {
    return PriorityTaskDetailsState(
      taskModel: taskModel ?? this.taskModel,
      todoList: todoList ?? this.todoList,
      seconds: second ?? this.seconds,
    );
  }

  @override
  List<Object?> get props => [taskModel, seconds, todoList];
}

class PriorityTaskDetailsInitial extends PriorityTaskDetailsState {
  const PriorityTaskDetailsInitial();
}
