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
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  Future<void> handleSendLinkToEmail(
    String emailAuth, {
    required Function onSuccess,
    required Function onError,
  }) async {
    var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: 'https://example.com/',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.example.hiTask',
        androidPackageName: 'com.example.hi_task',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');
    FirebaseAuth.instance
        .sendSignInLinkToEmail(
          email: emailAuth,
          actionCodeSettings: acs,
        )
        .catchError((error) => onError(error))
        .then(
          (value) => onSuccess(),
        );
  }
}
