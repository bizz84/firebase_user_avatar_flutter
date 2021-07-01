import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class CurrentUser {
  const CurrentUser({required this.uid});
  final String uid;
}

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  CurrentUser? _userFromFirebase(User? user) {
    return user == null ? null : CurrentUser(uid: user.uid);
  }

  Stream<CurrentUser?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase); // onAuthStateChanged.map(_userFromFirebase);
  }

  Future<CurrentUser?> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    print("Auth Result: $authResult");
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
