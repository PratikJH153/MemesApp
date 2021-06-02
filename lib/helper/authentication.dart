import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationStages {
  LoggingIn,
  LoggedIn,
  ErrorLoggingIn,
  SigningIn,
  SignedIn,
  ErrorSIgningIn,
}

enum AuthenticateException {
  PasswordWeak,
  AccountExists,
  UserNotFound,
  WrongPassword,
}

class AuthenticationHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> registeringVolunteer({
    String email,
    String password,
  }) async {
    User user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        // return AuthenticationStages.ErrorSIgningIn;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user.uid;
    // return AuthenticationStages.SignedIn;
  }

  Future<User> loginVolunteer({
    String email,
    String password,
  }) async {
    User user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      print("LOGGED IN SUCCESSFULLY!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return user;
  }

  // Future<void> verifyingUser() async {
  //   User user = auth.currentUser;

  //   if (!user.emailVerified) {
  //     var actionCodeSettings = ActionCodeSettings(
  //         url: 'https://www.gmail.com/?email=${user.email}',
  //         dynamicLinkDomain: "example.page.link",
  //         androidPackageName: "com.haum.signupgenius",
  //         androidMinimumVersion: "21",
  //         androidInstallApp: true,
  //         iOSBundleId: "com.haum.signupgenius",
  //         handleCodeInApp: true);

  //     await user.sendEmailVerification(actionCodeSettings);
  //   }
  // }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
