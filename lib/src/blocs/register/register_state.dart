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
  const RegisterState({
    this.username = "",
    this.email = "",
    this.password = "",
    this.confirmPass = "",
    this.isValid = false,
    this.status = RegisterStatusEnum.unknown,
    this.message = "",
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPass,
    bool? isValid,
    String? message,
    RegisterStatusEnum? status,
  }) {
    return RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPass: confirmPass ?? this.confirmPass,
        isValid: isValid ?? this.isValid,
        status: status ?? this.status,
        message: message ?? this.message);
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
      ];
}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  //const RegisterLoadingState();
}

class RegisterAuthenticatedState extends RegisterState {
  const RegisterAuthenticatedState(this.successText);
  final String successText;

  //@override
  //List<Object?> get props => [successText];
}

class RegisterUnauthenticatedState extends RegisterState {
  const RegisterUnauthenticatedState(this.errorText);
  final String errorText;

  //@override
  //List<Object?> get props => [errorText];
}
