import 'dart:convert';

import 'package:hi_task/src/models/model_exports.dart';

class CreateTaskRequest {
  Map<String, dynamic> toMap(TaskModel taskModel) => {};

  String toJson() => json.encode(toMap);
}
