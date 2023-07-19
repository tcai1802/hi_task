part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class ChangedEmailEvent extends LoginEvent {
  const ChangedEmailEvent(this.email);

  final String email;
  @override
  List<Object> get props => [email];
}

class ChangePassEvent extends LoginEvent {
  const ChangePassEvent(this.password);

  final String password;
  @override
  List<Object?> get props => [password];
}

class SubmitLoginEvent extends LoginEvent {
  const SubmitLoginEvent();
}
