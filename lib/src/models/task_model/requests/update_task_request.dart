import 'dart:convert';

import 'package:hi_task/src/models/model_exports.dart';

class UpdateTaskRequest {
  Map<String, dynamic> toMap(TaskModel taskModel) => {
        "title": taskModel.title,
        "startDate": taskModel.startDate,
        "endDate": taskModel.endDate,
        "description": taskModel.description,
        "todoList":
            taskModel.todoList!.map((todo) => const TodoModel().toMap(todo)),
        "updatedAt": DateTime.now(),
        "isCompleted": taskModel.isCompleted ?? false
      };

  String toJson() => json.encode(toMap);
}
