import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        users.doc(currentUser.id).update(UpdateUserRequest().toMap(userModel));
        onSuccess();
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> updatePassWord(
    String newPass,
    String currentPass, {
    Function(String message)? onSuccess,
    Function(String error)? onError,
  }) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User currentUser = firebaseAuth.currentUser!;
    await currentUser
        .reauthenticateWithCredential(
      EmailAuthProvider.credential(email: currentUser.email!, password: currentPass),
    )
        .then((value) async {
      await currentUser.updatePassword(newPass).then((value) {
        if (onSuccess != null) onSuccess("Change password successfully");
      }).catchError((err) {
        // An error has occured.
        if (onError != null) onError("Something error. Please try later");
      });
    }).catchError(
      (err) {
        if (onError != null) onError("Password incorrect");
      },
    );
  }
}
