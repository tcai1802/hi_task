part of 'settings_security_bloc.dart';

class SettingsSecurityState extends Equatable {
  final String newPassErr;
  final String currentPassErr;
  final String confirmPassErr;
  final bool isValidForm;
  final SettingsSecurityStatus status;
  final String? message;
  const SettingsSecurityState({
    this.newPassErr = "",
    this.currentPassErr = "",
    this.confirmPassErr = "",
    this.isValidForm = false,
    this.status = SettingsSecurityStatus.init,
    this.message,
  });

  SettingsSecurityState copyWith({
    String? newPassErr,
    String? currentPassErr,
    String? confirmPassErr,
    bool? isValidForm,
    SettingsSecurityStatus? status,
    String? message,
  }) {
    return SettingsSecurityState(
      newPassErr: newPassErr ?? this.newPassErr,
      currentPassErr: currentPassErr ?? this.currentPassErr,
      confirmPassErr: confirmPassErr ?? this.confirmPassErr,
      isValidForm: isValidForm ?? this.isValidForm,
      status: status ?? this.status,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        newPassErr,
        confirmPassErr,
        isValidForm,
        status,
        message
      ];
}

class SettingsSecurityInitial extends SettingsSecurityState {}
