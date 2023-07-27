import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hi_task/src/models/model_exports.dart';

class UserRepository {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  void createUser(UserModel userModel) {
    users.add(
      CreateUserRequest().toMap(userModel),
    );
  }
}
