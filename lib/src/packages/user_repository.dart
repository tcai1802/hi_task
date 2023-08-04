import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/models/user_model/requests/update_user_request.dart';

class UserRepository {
  final CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection("users");
  void createUser(UserModel userModel) {
    users.add(
      CreateUserRequest().toMap(userModel),
    );
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      final result = await users.where("userId", isEqualTo: userId).get();
      if (result.docs.isNotEmpty) {
        final UserModel data = UserModel.fromJson(result.docs.first.data());
        return data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> updateUser(
    UserModel userModel, {
    required Function onSuccess,
    required Function(String error) onError,
  }) async {
    try {
      final result = await users.where("userId", isEqualTo: userModel.userId).get();
      final currentUser = result.docs.first;
      if (result.docs.isNotEmpty) {
        users.doc(currentUser.id).update(UpdateUserRequest().toMap(userModel)).then((value) => {onSuccess()});
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
