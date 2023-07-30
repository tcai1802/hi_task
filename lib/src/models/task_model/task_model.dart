import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/enum/enum_convert.dart';

class TaskModel {
  final String? taskId;
  final String? userId;
  final String? title;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? description;
  final List<TodoModel>? todoList;
  final TaskTypeEnum? taskType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isCompleted;

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
    this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    //final List<TodoModel> data = List<TodoModel>.from(
    //  (json['todoList'] as List<dynamic>)
    //      .map((data) => TodoModel.fromJson(data)),
    //);
    //print('Data: $data');
    return TaskModel(
      taskId: json['taskId'],
      userId: json['userId'],
      title: json['title'],
      startDate: json['startDate'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(json['startDate'].seconds)
          : null,
      endDate: json['endDate'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(json['endDate'].seconds)
          : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      todoList: json['todoList'] != null
          ? List<TodoModel>.from(
              (json['todoList'] as List<dynamic>)
                  .map((data) => TodoModel.fromJson(data)),
            )
          : null,
      taskType: EnumConvert().convertTaskTypeEnum(json['taskType']),
      createdAt: json['createdAt'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(json['createdAt'].seconds)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(json['updatedAt'].seconds)
          : null,
      isCompleted: json['isCompleted'],
    );
  }
}
