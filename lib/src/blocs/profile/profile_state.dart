part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserModel? userModel;
  const ProfileState({
    this.userModel,
  });

  ProfileState copyWith({
    UserModel? userModel,
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [userModel];
}
