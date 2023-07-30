import 'dart:convert';

import 'package:hi_task/src/models/model_exports.dart';

class CreateTaskRequest {
  Map<String, dynamic> toMap(TaskModel taskModel, String taskId) => {
        "userId": taskModel.userId,
        "title": taskModel.title,
        "startDate": taskModel.startDate,
        "endDate": taskModel.endDate,
        "description": taskModel.description,
        "todoList":
            taskModel.todoList!.map((todo) => const TodoModel().toMap(todo)),
        "taskType": taskModel.taskType.toString().split(".")[1],
        "createdAt": taskModel.createdAt,
        "updatedAt": taskModel.updatedAt,
        "taskId": taskId,
        "isCompleted": taskModel.isCompleted ?? false
      };

  String toJson() => json.encode(toMap);
}
