import 'package:hi_task/src/models/user_model/user_model.dart';

class LoginResponse extends UserModel {
  const LoginResponse({
    super.userId,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json["userId"],
    );
  }
}
