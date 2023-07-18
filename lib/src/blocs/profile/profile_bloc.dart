import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/user_model/requests/login_request.dart';
import 'package:hi_task/src/models/user_model/response/login_response.dart';
import 'package:hi_task/src/models/user_model/user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState());

  void Hello() {
    final UserModel userModel = UserModel(userId: "hhhehe");
    final data = LoginRequest().toMap(userModel);
    print("data ${data}");
    final fakeData = {"userId": "TestData"};
    final data2 = LoginResponse.fromJson(fakeData);
    print("data2 ${data2.userId}");
  }
}
