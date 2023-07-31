part of 'edit_task_bloc.dart';

class EditTaskState extends Equatable {
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<TodoModel> todoList;
  final AddTaskStatusEnum ediTaskStatus;
  final String message;

  const EditTaskState({
    this.title = "",
    this.description = "",
    this.startDate,
    this.endDate,
    this.todoList = const [],
    this.ediTaskStatus = AddTaskStatusEnum.init,
    this.message = "",
  });

  EditTaskState copyWith({
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    List<TodoModel>? todoList,
    AddTaskStatusEnum? ediTaskStatus,
    String? message,
  }) {
    return EditTaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      todoList: todoList ?? this.todoList,
      ediTaskStatus: ediTaskStatus ?? this.ediTaskStatus,
      message: message ?? this.message,
    );
  }

  @override
  List get props => [
        title,
        description,
        startDate,
        endDate,
        todoList,
        ediTaskStatus,
        message,
      ];
}
