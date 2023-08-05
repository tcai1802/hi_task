part of 'edit_profile_bloc.dart';

class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class OnChangeAvatarAssetEvent extends EditProfileEvent {
  //final String imageAsset;
  const OnChangeAvatarAssetEvent();

  @override
  List<Object> get props => [];
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

class UpdateProfileEvent extends EditProfileEvent {
  final UserModel originData;
  const UpdateProfileEvent(this.originData);

  @override
  // TODO: implement props
  List<Object> get props => [originData];
}

class ClearDataEvent extends EditProfileEvent {}
