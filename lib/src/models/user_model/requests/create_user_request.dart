import 'dart:convert';

import 'package:hi_task/src/models/user_model/user_model.dart';

class CreateUserRequest {
  Map<String, dynamic> toMap(UserModel userModel) => {
        "userId": userModel.userId,
        "userName": userModel.userName,
        "email": userModel.email,
        "loginMethod": userModel.loginMethod,
        "dateOfBirth": userModel.dateOfBirth,
        "profession": userModel.profession,
        "createdAt": userModel.createdAt.toString(),
        "updatedAt": userModel.updatedAt.toString(),
      };
  String toJson() => json.encode(toMap);
}
