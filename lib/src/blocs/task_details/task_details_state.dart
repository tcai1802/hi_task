part of 'task_details_bloc.dart';

class TaskDetailsState extends Equatable {
  final TaskModel? taskModel;
  final int seconds;
  final List<TodoModel> todoList;
  final double percentCompleted;
  final bool finishedTask;
  const TaskDetailsState({
    this.taskModel,
    this.seconds = 0,
    this.todoList = const <TodoModel>[],
    this.percentCompleted = 0.0,
    this.finishedTask = false,
  });

  TaskDetailsState copyWith({
    TaskModel? taskModel,
    int? seconds,
    List<TodoModel>? todoList,
    int? days,
    int? minutes,
    int? hours,
    int? second,
    double? percentCompleted,
    bool? finishedTask,
  }) {
    return TaskDetailsState(
      taskModel: taskModel ?? this.taskModel,
      todoList: todoList ?? this.todoList,
      seconds: second ?? this.seconds,
      percentCompleted: percentCompleted ?? this.percentCompleted,
      finishedTask: finishedTask ?? this.finishedTask,
    );
  }

  @override
  List<Object?> get props => [
        taskModel,
        seconds,
        todoList,
        percentCompleted,
        finishedTask,
      ];
}

class TaskDetailsInitial extends TaskDetailsState {
  const TaskDetailsInitial();
}
