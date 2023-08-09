import 'dart:convert';

class UpdateCompleteRequest {
  Map<String, dynamic> toMap(bool isCompleted) => {"isCompleted": isCompleted};

  String toJson() => json.encode(toMap);
}
