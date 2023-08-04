part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final String? imageAsset;

  final String? userName;
  final String? profession;
  final DateTime? dateOfBirth;
  const EditProfileState({
    this.imageAsset,
    this.userName,
    this.profession,
    this.dateOfBirth,
  });
  EditProfileState copyWith({String? imageAsset, String? userName, String? profession, DateTime? dateOfBirth}) {
    return EditProfileState(
      imageAsset: this.imageAsset,
      userName: this.userName,
      profession: this.profession,
      dateOfBirth: this.dateOfBirth,
    );
  }

  @override
  List get props => [
        imageAsset,
        userName,
        profession,
        dateOfBirth,
      ];
}

class EditProfileInitial extends EditProfileState {}
