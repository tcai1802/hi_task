import 'package:equatable/equatable.dart';

class HelpModel extends Equatable {
  final String? userId;
  final String? userName;
  final String? email;
  final String content;
  final DateTime? createdAt;
  const HelpModel({
    this.userId,
    this.userName,
    this.email,
    this.content = "",
    this.createdAt,
  });
  Map<String, dynamic> toMap(HelpModel helpModel) => {
        "userId": helpModel.userId,
        "userName": helpModel.userName,
        "email": helpModel.email,
        "content": helpModel.content,
        "createdAt": helpModel.createdAt,
      };

  @override
  List<Object?> get props => [
        userId,
        userName,
        email,
        content,
        createdAt,
      ];
}
