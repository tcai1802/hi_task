import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/packages/help_repository.dart';
import 'package:hi_task/src/packages/user_repository.dart';

part 'settings_help_event.dart';
part 'settings_help_state.dart';

enum SettingHelpStatus { init, loading, success, failed }

class SettingsHelpBloc extends Bloc<SettingsHelpEvent, SettingsHelpState> {
  final HelpRepository _helpRepository = HelpRepository();
  SettingsHelpBloc() : super(const SettingsHelpState()) {
    on<OnChangeHelpInputEvent>(_onChangeHelpInputEvent);
    on<OnSubmitEvent>(_onSubmitEvent);
  }

  _onChangeHelpInputEvent(
    OnChangeHelpInputEvent event,
    Emitter<SettingsHelpState> emit,
  ) {
    emit(state.copyWith(enableSubmitBtn: event.helpText.isNotEmpty));
  }

  _onSubmitEvent(
    OnSubmitEvent event,
    Emitter<SettingsHelpState> emit,
  ) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final UserModel? user = await UserRepository().getUser(userId);
    final HelpModel helpModel = HelpModel(
      userId: user?.userId,
      content: event.helpText,
      email: user?.email,
      userName: user?.userName,
      createdAt: DateTime.now(),
    );
    await _helpRepository.handleSubmitHelp(helpModel, onSuccess: () {
      emit(state.copyWith(
        status: SettingHelpStatus.success,
      ));
    }, onError: () {
      emit(state.copyWith(
        status: SettingHelpStatus.failed,
      ));
    });
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: SettingHelpStatus.init));
  }
}
