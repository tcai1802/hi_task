part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class OnRegisterInitEvent extends RegisterEvent {
  const OnRegisterInitEvent();
  @override
  List<Object?> get props => [];
}

class OnChangedUserNameEvent extends RegisterEvent {
  const OnChangedUserNameEvent(this.username);

  final String username;

  @override
  List<Object?> get props => [username];
}

class OnChangedEmailEvent extends RegisterEvent {
  const OnChangedEmailEvent(this.email);

  final String email;
  @override
  List<Object?> get props => [email];
}

class OnChangedPasswordEvent extends RegisterEvent {
  const OnChangedPasswordEvent(this.password);

  final String password;
  @override
  List<Object?> get props => [password];
}

class OnChangedConfirmPassEvent extends RegisterEvent {
  const OnChangedConfirmPassEvent(this.confirmPass);

  final String confirmPass;
  @override
  List<Object?> get props => [confirmPass];
}

class OnRegisterSubmitEvent extends RegisterEvent {
  final bool isLoading;
  const OnRegisterSubmitEvent(this.isLoading);
}
