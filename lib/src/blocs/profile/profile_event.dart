part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitEvent extends ProfileEvent {
  ProfileInitEvent();
}

class OnLogoutRequested extends ProfileEvent {
  OnLogoutRequested();
}
