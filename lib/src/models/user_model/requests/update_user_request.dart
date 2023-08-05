import 'dart:convert';

import 'package:hi_task/src/models/user_model/user_model.dart';

class UpdateUserRequest {
  Map<String, dynamic> toMap(UserModel userModel) => {
        "userName": userModel.userName,
        "dateOfBirth": userModel.dateOfBirth,
        "profession": userModel.profession,
        "updatedAt": userModel.updatedAt,
        "avatarUrl": userModel.avatarUrl,
      };
  String toJson() => json.encode(toMap);
}
