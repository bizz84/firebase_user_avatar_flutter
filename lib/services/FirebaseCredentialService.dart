import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  UserProfile(this.email, this.password);

  UserProfile.empty({this.email = '', this.password = ''});

  String email;
  String password;
}

class FirebaseCredentialService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(UserProfile profile) async {
    try {
      final user = _firebaseAuth.signInWithEmailAndPassword(
          email: profile.email, password: profile.password);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found on db');
      } else if (e.code == 'wrong-password') {
        print('password is wrong');
      }
    }

    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
