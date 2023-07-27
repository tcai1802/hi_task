import 'package:hi_task/src/res/enum/app_enum.dart';

class TaskModel {
  final String? taskId;
  final String? userId;
  final String? title;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? description;
  final List? todoList;
  final TaskTypeEnum? taskType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TaskModel({
    this.taskId,
    this.userId,
    this.title,
    this.startDate,
    this.endDate,
    this.description,
    this.todoList,
    this.taskType,
    this.createdAt,
    this.updatedAt,
  });
}
