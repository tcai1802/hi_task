part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  final DateTime? startTime;
  final DateTime? endTime;
  final String? title;
  final TaskTypeEnum? taskTypeEnum;
  final List<TodoModel> todoList;
  final String? description;
  final AddTaskStatusEnum addTaskStatusEnum;
  final String? message;

  const AddTaskState({
    this.startTime,
    this.endTime,
    this.title,
    this.taskTypeEnum = TaskTypeEnum.priorityTask,
    this.description,
    this.todoList = const [],
    this.addTaskStatusEnum = AddTaskStatusEnum.init,
    this.message,
  });

  AddTaskState copyWith({
    DateTime? startTime,
    DateTime? endTime,
    String? title,
    TaskTypeEnum? taskTypeEnum,
    String? description,
    List<TodoModel>? todoList,
    AddTaskStatusEnum? addTaskStatusEnum,
    final String? message,
  }) {
    return AddTaskState(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      title: title ?? this.title,
      taskTypeEnum: taskTypeEnum ?? this.taskTypeEnum,
      description: description ?? this.description,
      todoList: todoList ?? this.todoList,
      addTaskStatusEnum: addTaskStatusEnum ?? this.addTaskStatusEnum,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        startTime,
        endTime,
        title,
        taskTypeEnum,
        description,
        todoList,
        addTaskStatusEnum,
        message,
      ];
}
