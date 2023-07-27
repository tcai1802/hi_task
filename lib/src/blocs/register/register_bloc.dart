import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_task/src/packages/authentication_repository.dart';
import 'package:hi_task/src/res/regex/app_regex.dart';

part 'register_event.dart';
part 'register_state.dart';

enum RegisterStatusEnum { unknown, loading, success, failure }

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<OnRegisterInitEvent>(_onRegisterInitEvent);
    on<OnChangedUserNameEvent>(_onChangeUserNameEvent);
    on<OnChangedEmailEvent>(_onChangeEmailEvent);
    on<OnChangedPasswordEvent>(_onChangePasswordEvent);
    on<OnChangedConfirmPassEvent>(_onChangeConfirmPassEvent);
    on<OnRegisterSubmitEvent>(_onRegisterSubmitEvent);
  }

  @override
  Future<void> close() {
    print("Close");
    return super.close();
  }

  void _onRegisterInitEvent(
    OnRegisterInitEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        username: "",
        email: "",
        confirmPass: "",
        isValid: false,
        password: "",
        message: "",
        status: RegisterStatusEnum.unknown,
      ),
    );
  }

  void _onChangeUserNameEvent(
    OnChangedUserNameEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        username: event.username,
        isValid: _handleValidateRegisterForm(
          username: event.username,
          email: state.email,
          password: state.password,
          confirmPass: state.confirmPass,
        ),
      ),
    );
    emit(
      state.copyWith(
        isValid: (state.userNameErr == null || state.userNameErr!.isEmpty) &&
            (state.emailErr == null || state.emailErr!.isEmpty) &&
            (state.passErr == null || state.passErr!.isEmpty) &&
            (state.confirmPass == state.password),
      ),
    );
  }

  void _onChangeEmailEvent(
    OnChangedEmailEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
          email: event.email, emailErr: handleEmailValidate(event.email)),
    );
    emit(
      state.copyWith(
        isValid: (state.userNameErr == null || state.userNameErr!.isEmpty) &&
            (state.emailErr == null || state.emailErr!.isEmpty) &&
            (state.passErr == null || state.passErr!.isEmpty) &&
            (state.confirmPass == state.password),
      ),
    );
  }

  void _onChangePasswordEvent(
    OnChangedPasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        passErr: handlePassValidate(event.password),
      ),
    );
    emit(
      state.copyWith(
        isValid: (state.userNameErr == null || state.userNameErr!.isEmpty) &&
            (state.emailErr == null || state.emailErr!.isEmpty) &&
            (state.passErr == null || state.passErr!.isEmpty) &&
            (state.confirmPass == state.password),
      ),
    );
  }

  void _onChangeConfirmPassEvent(
    OnChangedConfirmPassEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPass: event.confirmPass,
        confirmPassErr: event.confirmPass == state.password
            ? ""
            : "Confirm password is incorrect",
      ),
    );
    emit(
      state.copyWith(
        isValid: (state.userNameErr == null || state.userNameErr!.isEmpty) &&
            (state.emailErr == null || state.emailErr!.isEmpty) &&
            (state.passErr == null || state.passErr!.isEmpty) &&
            (state.confirmPass == state.password),
      ),
    );
  }

  String handleEmailValidate(String email) {
    final RegExp emailRegex = RegExp(AppRegex().emailRegex);
    if (emailRegex.hasMatch(email)) {
      return "";
    }
    return "Invalid email";
  }

  String? handlePassValidate(String password) {
    final RegExp passRegex = RegExp(AppRegex().passRegex);
    if (passRegex.hasMatch(password)) {
      return "";
    }
    return "Invalid password";
  }

  bool _handleValidateRegisterForm({
    String? username = "",
    String? email = "",
    String? password = "",
    String? confirmPass = "",
  }) {
    if (username!.isEmpty ||
        email!.isEmpty ||
        password!.isEmpty ||
        confirmPass!.isEmpty) return false;
    final RegExp emailRegex = RegExp(AppRegex().emailRegex);
    final RegExp passRegex = RegExp(AppRegex().passRegex);
    if (emailRegex.hasMatch(email) &&
        passRegex.hasMatch(password) &&
        password == confirmPass) {
      return true;
    }
    return false;
  }

  ///
  /// handle sign up account
  ///
  void _onRegisterSubmitEvent(
    OnRegisterSubmitEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      status: RegisterStatusEnum.loading,
    ));
    Future.delayed(const Duration(seconds: 2));
    try {
      await AuthenticationRepository().handleRegister(
          email: state.email!,
          password: state.password!,
          onSuccess: (User user) {
            emit(state.copyWith(
              status: RegisterStatusEnum.success,
              message: "Đăng nhập thành công",
            ));
          },
          onError: (String error) {
            emit(
              state.copyWith(
                status: RegisterStatusEnum.failure,
                message: error,
              ),
            );
          });
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatusEnum.failure,
          message: "",
        ),
      );
    }
  }
}
