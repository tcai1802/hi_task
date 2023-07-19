import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        isValid: _handleValidateLoginForm(state),
      ),
    );
  }

  void _onChangePassEvent(
    ChangePassEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        isValid: _handleValidateLoginForm(state),
      ),
    );
  }

  void _onSubmitLoginEvent(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) {}

  bool _handleValidateLoginForm(LoginState state) {
    // Check value is null for email and passworod
    if (state.email == null || state.password == null) return false;

    RegExp emailRegex = RegExp(AppRegex().emailRegex);
    final RegExp passRegex = RegExp(AppRegex().passRegex);
    if (emailRegex.hasMatch(state.email!) &&
        passRegex.hasMatch(state.password!)) {
      return true;
    }
    print("not OKO");
    return false;
  }
}
