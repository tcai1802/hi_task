import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/packages/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<OnLogoutRequested>(_onLogoutRequested);
    on<ProfileInitEvent>(_profileInitEvent);
  }
  void _onLogoutRequested(
    OnLogoutRequested event,
    Emitter<ProfileState> emit,
  ) {
    FirebaseAuth.instance.signOut();
  }

  _profileInitEvent(
    ProfileInitEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final UserModel? user = await UserRepository().getUser(userId);
    //print('Data1111: ${data}');
    emit(state.copyWith(
      userModel: user,
    ));
  }

  //Stream<int> getTotalTaskCompleted(String userId) async* {

  //  FirebaseFirestore.instance.collection("posts")

  //  yield 0;
  //}
}
