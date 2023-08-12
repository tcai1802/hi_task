part of 'settings_security_bloc.dart';

abstract class SettingsSecurityEvent extends Equatable {
  const SettingsSecurityEvent();

  @override
  List<Object> get props => [];
}

class OnChangeCurrentPassword extends SettingsSecurityEvent {
  final String currentPass;
  const OnChangeCurrentPassword(this.currentPass);
}

class OnChangeNewPassword extends SettingsSecurityEvent {
  final String newPassInput;
  const OnChangeNewPassword(this.newPassInput);
}

class OnChangeConfirmPassword extends SettingsSecurityEvent {
  final String newPassInput;
  final String confirmPassInput;
  const OnChangeConfirmPassword(
    this.newPassInput,
    this.confirmPassInput,
  );
}

class OnSubmitChangePassword extends SettingsSecurityEvent {
  final String newPassInput;
  final String currentPass;
  const OnSubmitChangePassword(
    this.newPassInput,
    this.currentPass,
  );
}
