import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/user_model/user_model.dart';
import 'package:hi_task/src/packages/media_repository.dart';
import 'package:hi_task/src/packages/user_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

enum EditProfileStatus { init, loading, success, failure }

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<EditProfileInitEvent>(_editProfileInitEvent);
    on<OnChangeAvatarAssetEvent>(_onChangeAvatarAssetEvent);
    on<OnChangeUserNameEvent>(_onChangeUserNameEvent);
    on<OnChangeProfessionEvent>(_onChangeProfessionEvent);
    on<OnChangeDateOfBirthEvent>(_onChangeDateOfBirthEvent);
    on<UpdateProfileEvent>(_updateProfileEvent);
    on<ClearDataEvent>(_clearDataEvent);
  }

  //----------------- Edit Profile Bloc Function ------------------------///
  _clearDataEvent(
    ClearDataEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.clearState());
  }

  _editProfileInitEvent(
    EditProfileInitEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.clearState());
    emit(state.copyWith(
      userName: event.userData.userName,
      profession: event.userData.profession,
      dateOfBirth: event.userData.dateOfBirth,
      isValid: false,
    ));
  }

  _onChangeAvatarAssetEvent(
    OnChangeAvatarAssetEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    //print("Data: ${image!.readAsString()}");
    emit(state.copyWith(
      imageAsset: image,
    ));
    emit(state.copyWith(
      isValid: _handleCheckValidForm(),
    ));
  }

  _onChangeUserNameEvent(
    OnChangeUserNameEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(
      userName: event.userName,
      isValid: _handleCheckValidForm(),
    ));
    emit(state.copyWith(
      isValid: _handleCheckValidForm(),
    ));
  }

  _onChangeProfessionEvent(
    OnChangeProfessionEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(
      profession: event.profession,
    ));
    emit(state.copyWith(
      isValid: _handleCheckValidForm(),
    ));
  }

  _onChangeDateOfBirthEvent(
    OnChangeDateOfBirthEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(
      dateOfBirth: event.dateOfBirth,
    ));
    emit(state.copyWith(
      isValid: _handleCheckValidForm(),
    ));
    //print("Time: ${state.dateOfBirth}");
  }

  _handleCheckValidForm() {
    if (state.userName != null &&
        state.userName!.isNotEmpty &&
        state.profession != null &&
        state.profession!.isNotEmpty &&
        state.dateOfBirth != null) {
      return true;
    }
    return false;
  }

  _updateProfileEvent(
    UpdateProfileEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    if (state.userName != null && state.userName!.isNotEmpty ||
        state.profession != null && state.profession!.isNotEmpty ||
        state.dateOfBirth != null && state.imageAsset != null) {
      emit(state.copyWith(editProfileStatus: EditProfileStatus.loading));

      String? avatarUrl;
      if (state.imageAsset != null) {
        avatarUrl = await MediaRepository().uploadFile(state.imageAsset!);
      }
      final UserModel userModel = UserModel(
        userId: event.originData.userId,
        userName: state.userName,
        profession: state.profession,
        dateOfBirth: state.dateOfBirth,
        avatarUrl: avatarUrl ?? event.originData.avatarUrl,
      );
      await UserRepository().updateUser(
        userModel,
        onSuccess: () {
          emit(state.copyWith(editProfileStatus: EditProfileStatus.success));
        },
        onError: (error) {
          emit(state.copyWith(editProfileStatus: EditProfileStatus.failure));
        },
      );
      emit(state.copyWith(editProfileStatus: EditProfileStatus.init));
    }
  }
  //----------------- End Edit Profile Bloc Function --------------------///
}
