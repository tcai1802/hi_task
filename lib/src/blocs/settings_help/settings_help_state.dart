part of 'settings_help_bloc.dart';

class SettingsHelpState extends Equatable {
  final bool enableSubmitBtn;
  final SettingHelpStatus status;
  const SettingsHelpState({
    this.enableSubmitBtn = false,
    this.status = SettingHelpStatus.init,
  });

  SettingsHelpState copyWith({
    bool? enableSubmitBtn,
    SettingHelpStatus? status,
  }) {
    return SettingsHelpState(
      enableSubmitBtn: enableSubmitBtn ?? this.enableSubmitBtn,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [enableSubmitBtn, status];
}

class SettingsHelpInitial extends SettingsHelpState {}
