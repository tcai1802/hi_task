import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hi_task/src/models/model_exports.dart';

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
}
