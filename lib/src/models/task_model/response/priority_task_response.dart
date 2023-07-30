import 'package:hi_task/src/models/task_model/exports.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class PriorityTaskResponse {
  final String? taskId;
  final String? userId;
  final String? title;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? description;
  final TaskTypeEnum? taskType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isCompleted;
  const PriorityTaskResponse({
    this.taskId,
    this.userId,
    this.title,
    this.startDate,
    this.endDate,
    this.description,
    this.taskType,
    this.createdAt,
    this.updatedAt,
    this.isCompleted,
  });
  factory PriorityTaskResponse.fromJson(Map<String, dynamic> json) {
    return PriorityTaskResponse();
  }
}
