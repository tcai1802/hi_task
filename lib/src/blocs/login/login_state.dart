part of 'login_bloc.dart';

enum LoginStatusEnum { init, loading, failed, success }

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.isValid = false,
    this.message = "",
    this.status = LoginStatusEnum.init,
  });
  final String? email;
  final String? password;
  final bool isValid;
  final String message;
  final LoginStatusEnum status;

  LoginState copyWith({
    String? email,
    String? password,
    bool? isValid,
    String? message,
    LoginStatusEnum? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email, password, isValid, message, status];
}
