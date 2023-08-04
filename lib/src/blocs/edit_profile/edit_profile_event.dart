part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class OnChangeAvatarAssetEvent extends EditProfileEvent {
  final String imageAsset;
  const OnChangeAvatarAssetEvent(this.imageAsset);

  @override
  List<Object> get props => [imageAsset];
}

class EditProfileInitEvent extends EditProfileEvent {
  final UserModel userData;
  const EditProfileInitEvent(this.userData);

  @override
  List<Object> get props => [userData];
}

class OnChangeUserNameEvent extends EditProfileEvent {
  final String userName;
  const OnChangeUserNameEvent(this.userName);

  @override
  List<Object> get props => [userName];
}

class OnChangeProfessionEvent extends EditProfileEvent {
  final String profession;
  const OnChangeProfessionEvent(this.profession);

  @override
  List<Object> get props => [profession];
}

class OnChangeDateOfBirthEvent extends EditProfileEvent {
  final DateTime dateOfBirth;
  const OnChangeDateOfBirthEvent(this.dateOfBirth);

  @override
  List<Object> get props => [dateOfBirth];
}

class UpdateProfileEvent extends EditProfileEvent {}
