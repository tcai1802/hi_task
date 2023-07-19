part of 'login_bloc.dart';

enum LoginStateEnum { init, failed, success }

class LoginState extends Equatable {
  const LoginState({
    this.loginStateEnum = LoginStateEnum.init,
    this.email,
    this.password,
    this.isValid = false,
  });
  final LoginStateEnum loginStateEnum;
  final String? email;
  final String? password;
  final bool isValid;

  LoginState copyWith({String? email, String? password, bool? isValid}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [loginStateEnum, email, password, isValid];
}
