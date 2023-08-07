import 'dart:convert';

import 'package:hi_task/src/models/model_exports.dart';

class UpdateTodoRequest {
  Map<String, dynamic> toMap(List<TodoModel> todoList) => {
        "todoList":
            todoList.map((todo) => const TodoModel().toMap(todo)),
      };

  String toJson() => json.encode(toMap);
}
