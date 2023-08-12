import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/packages/user_repository.dart';
import 'package:hi_task/src/res/regex/app_regex.dart';

part 'settings_security_event.dart';
part 'settings_security_state.dart';

enum SettingsSecurityStatus { init, loading, success, failed }

class SettingsSecurityBloc extends Bloc<SettingsSecurityEvent, SettingsSecurityState> {
  final UserRepository _userRepository = UserRepository();

  SettingsSecurityBloc() : super(SettingsSecurityInitial()) {
    on<OnChangeNewPassword>(_onChangeNewPassword);
    on<OnChangeConfirmPassword>(_onChangeConfirmPassword);
    on<OnSubmitChangePassword>(_onSubmitChangePassword);
    on<OnChangeCurrentPassword>(_onChangeCurrentPassword);
  }

  _onChangeNewPassword(
    OnChangeNewPassword event,
    Emitter<SettingsSecurityState> emit,
  ) {
    final RegExp passRegex = RegExp(AppRegex().passRegex);
    if (passRegex.hasMatch(event.newPassInput)) {
      emit(state.copyWith(
        newPassErr: "",
        isValidForm: state.confirmPassErr.isEmpty && state.currentPassErr.isEmpty,
      ));
    } else {
      emit(state.copyWith(
        newPassErr: "Invalid",
        isValidForm: false,
      ));
    }
  }

  _onChangeCurrentPassword(
    OnChangeCurrentPassword event,
    Emitter<SettingsSecurityState> emit,
  ) {
    final RegExp passRegex = RegExp(AppRegex().passRegex);

    if (event.currentPass.isNotEmpty) {
      emit(state.copyWith(
        currentPassErr: "",
        isValidForm: state.confirmPassErr.isEmpty,
      ));
    }
    if (passRegex.hasMatch(event.currentPass)) {
      emit(state.copyWith(
        currentPassErr: "",
        isValidForm: state.confirmPassErr.isEmpty && state.newPassErr.isEmpty,
      ));
    } else {
      emit(state.copyWith(
        currentPassErr: "Invalid",
        isValidForm: false,
      ));
    }

    //return "Invalid new password";
  }

  _onChangeConfirmPassword(
    OnChangeConfirmPassword event,
    Emitter<SettingsSecurityState> emit,
  ) {
    if (event.confirmPassInput == event.newPassInput) {
      emit(state.copyWith(
        confirmPassErr: "",
        isValidForm: state.newPassErr.isEmpty && state.currentPassErr.isEmpty,
      ));
    } else {
      emit(state.copyWith(
        confirmPassErr: "Incorrect confirm password",
        isValidForm: false,
      ));
    }
  }

  _onSubmitChangePassword(
    OnSubmitChangePassword event,
    Emitter<SettingsSecurityState> emit,
  ) async {
    await _userRepository.updatePassWord(
      event.newPassInput,
      event.currentPass,
      onSuccess: (message) {
        emit(state.copyWith(
          status: SettingsSecurityStatus.success,
          message: message,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          status: SettingsSecurityStatus.failed,
          message: error,
        ));
      },
    );
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: SettingsSecurityStatus.init));
  }
}
