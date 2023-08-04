import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_task/src/packages/authentication_repository.dart';
import 'package:hi_task/src/res/regex/app_regex.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<ChangedEmailEvent>(_onChangeEmailEvent);
    on<ChangePassEvent>(_onChangePassEvent);
    on<SubmitLoginEvent>(_onSubmitLoginEvent);
  }


  void _onChangeEmailEvent(
    ChangedEmailEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
    emit(
      state.copyWith(isValid: _handleValidateLoginForm()),
    );
  }

  void _onChangePassEvent(
    ChangePassEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
    emit(state.copyWith(isValid: _handleValidateLoginForm()));
  }

  Future<void> _onSubmitLoginEvent(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatusEnum.loading));
    // Handle with firebase
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepository();
    await authenticationRepository.handleLogin(
      onSuccess: (User user) {
        emit(state.copyWith(status: LoginStatusEnum.success));
        emit(state.copyWith(status: LoginStatusEnum.init));
      },
      onError: (error) {
        //print("Error: ${error}");
        emit(state.copyWith(status: LoginStatusEnum.failed));
        emit(state.copyWith(status: LoginStatusEnum.init));
      },
      email: state.email!,
      password: state.password!,
    );
  }

  bool _handleValidateLoginForm() {
    // Check value is null for email and password
    if (state.email == null || state.password == null) return false;

    RegExp emailRegex = RegExp(AppRegex().emailRegex);
    final RegExp passRegex = RegExp(AppRegex().passRegex);
    if (emailRegex.hasMatch(state.email!) &&
        passRegex.hasMatch(state.password!)) {
      return true;
    }
    return false;
  }
}
