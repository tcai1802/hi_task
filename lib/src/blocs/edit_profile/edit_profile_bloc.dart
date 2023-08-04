import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/user_model/user_model.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    //on<EditProfileEvent>((event, emit) {});
    on<EditProfileInitEvent>(_editProfileInitEvent);
    on<OnChangeAvatarAssetEvent>(_onChangeAvatarAssetEvent);
    on<OnChangeUserNameEvent>(_onChangeUserNameEvent);
    on<OnChangeProfessionEvent>(_onChangeProfessionEvent);
    on<OnChangeDateOfBirthEvent>(_onChangeDateOfBirthEvent);
    on<UpdateProfileEvent>(_updateProfileEvent);
  }

  //----------------- Edit Profile Bloc Function ------------------------///
  _editProfileInitEvent(
    EditProfileInitEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(

    ));
  }

  _onChangeAvatarAssetEvent(
    OnChangeAvatarAssetEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(imageAsset: event.imageAsset));
  }

  _onChangeUserNameEvent(
    OnChangeUserNameEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(userName: event.userName));
  }

  _onChangeProfessionEvent(
    OnChangeProfessionEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(profession: event.profession));
  }

  _onChangeDateOfBirthEvent(
    OnChangeDateOfBirthEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  _updateProfileEvent(
    UpdateProfileEvent event,
    Emitter<EditProfileState> emit,
  ) {  }
  //----------------- End Edit Profile Bloc Function --------------------///
}
