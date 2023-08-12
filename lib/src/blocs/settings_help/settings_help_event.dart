part of 'settings_help_bloc.dart';

abstract class SettingsHelpEvent extends Equatable {
  const SettingsHelpEvent();

  @override
  List<Object> get props => [];
}

class OnChangeHelpInputEvent extends SettingsHelpEvent {
  final String helpText;
  const OnChangeHelpInputEvent(this.helpText);

  @override
  List<Object> get props => [helpText];
}

class OnSubmitEvent extends SettingsHelpEvent {
  final String helpText;
  const OnSubmitEvent(this.helpText);

  @override
  List<Object> get props => [helpText];
}
