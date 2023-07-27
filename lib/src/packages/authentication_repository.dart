import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hi_task/src/models/user_model/exports.dart';

class AuthenticationRepository {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  Future<void> handleRegister({
    required String username,
    required String email,
    required String password,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await users.add(
          CreateUserRequest().toMap(
            UserModel(
              email: email,
              userId: credential.user!.uid,
              userName: username,
              createdAt: DateTime.now().toUtc(),
              updatedAt: DateTime.now().toUtc(),
            ),
          ),
        );

        credential.user!.sendEmailVerification();
      }
      onSuccess(credential.user);
    } on FirebaseAuthException catch (e) {
      onError(e.code);
      if (e.code == 'weak-password') {
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> handleLogin({
    String email = "",
    String password = "",
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        if (!credential.user!.emailVerified) {
          credential.user!.sendEmailVerification();
        }
        onSuccess(credential.user);
      } else {
        throw Exception("Some thing error");
      }
    } on FirebaseAuthException catch (e) {
      onError(e.code);
    } catch (e) {
      onError(e);
    }
  }
}
