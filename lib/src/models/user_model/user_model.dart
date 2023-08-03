import 'package:hi_task/src/utils/datetime_format.dart';

class UserModel {
  const UserModel({
    this.userId = "",
    this.userName,
    this.email,
    this.password,
    this.loginMethod,
    this.isVerified,
    this.dateOfBirth,
    this.profession,
    this.createdAt,
    this.updatedAt,
    this.avatarUrl,
  });
  final String userId;
  final String? userName;
  final String? email;
  final String? password;
  final String? loginMethod;
  final bool? isVerified;
  final DateTime? dateOfBirth;
  final String? profession;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? avatarUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      userName: json["userName"],
      email: json["email"],
      loginMethod: json["loginMethod"],
      profession: json["profession"],
      dateOfBirth: json["dateOfBirth"] != null ? DateTimeFormat().convertStringToDateTime(json["dateOfBirth"]) : null,
      avatarUrl: json["avatarUrl"],
    );
  }
}
