import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
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

  @override
  List<Object?> get props => [];
}
