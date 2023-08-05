part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final XFile? imageAsset;
  final String? userName;
  final String? profession;
  final DateTime? dateOfBirth;
  final EditProfileStatus editProfileStatus;
  final bool isValid;
  const EditProfileState({
    this.imageAsset,
    this.userName,
    this.profession,
    this.dateOfBirth,
    this.editProfileStatus = EditProfileStatus.init,
    this.isValid = false,
  });
  EditProfileState copyWith({
    XFile? imageAsset,
    String? userName,
    String? profession,
    DateTime? dateOfBirth,
    EditProfileStatus? editProfileStatus,
    bool? isValid,
  }) {
    return EditProfileState(
      imageAsset: imageAsset ?? this.imageAsset,
      userName: userName ?? this.userName,
      profession: profession ?? this.profession,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      editProfileStatus: editProfileStatus ?? this.editProfileStatus,
      isValid: isValid ?? this.isValid,
    );
  }
  EditProfileState clearState() {
    return const EditProfileState(
      imageAsset: null,
      userName: null,
      profession: null,
      dateOfBirth: null,
      editProfileStatus: EditProfileStatus.init,
      isValid: false,
    );
  }


  @override
  List get props => [
        imageAsset,
        userName,
        profession,
        dateOfBirth,
        editProfileStatus,
        isValid,
      ];
}

class EditProfileInitial extends EditProfileState {
  EditProfileInitial();
}
