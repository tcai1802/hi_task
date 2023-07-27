import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  Future<void> handleRegister({
    required String email,
    required String password,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
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
