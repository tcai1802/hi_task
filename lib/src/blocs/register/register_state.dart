part of 'register_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class RegisterState extends Equatable {
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPass;
  final bool isValid;
  final RegisterStatusEnum status;
  final String message;
  final String? userNameErr;
  final String? emailErr;
  final String? passErr;
  final String? confirmPassErr;
  const RegisterState({
    this.username = "",
    this.email = "",
    this.password = "",
    this.confirmPass = "",
    this.isValid = false,
    this.status = RegisterStatusEnum.unknown,
    this.message = "",
    this.userNameErr,
    this.emailErr,
    this.passErr,
    this.confirmPassErr,
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPass,
    bool? isValid,
    String? message,
    RegisterStatusEnum? status,
    String? userNameErr,
    String? emailErr,
    String? passErr,
    String? confirmPassErr,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPass: confirmPass ?? this.confirmPass,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      message: message ?? this.message,
      userNameErr: userNameErr ?? this.userNameErr,
      emailErr: emailErr ?? this.emailErr,
      passErr: passErr ?? this.passErr,
      confirmPassErr: confirmPassErr ?? this.confirmPassErr,
    );
  }

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        confirmPass,
        isValid,
        status,
        message,
        userNameErr,
        emailErr,
        passErr,
      ];
}
