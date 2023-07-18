import 'dart:convert';

import 'package:hi_task/src/models/user_model/user_model.dart';

class LoginRequest {
  Map<String, dynamic> toMap(UserModel userModel) => {
        "userId": userModel.userId,
      };
  String toJson() => json.encode(toMap);
}
