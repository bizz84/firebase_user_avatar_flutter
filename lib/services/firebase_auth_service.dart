import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class currentUser {
  const currentUser({required this.uid});
  final String uid;
}

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  currentUser? _userFromFirebase(User? user) {
    return user == null ? null : currentUser(uid: user.uid);
  }

  Stream<currentUser?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase); // onAuthStateChanged.map(_userFromFirebase);
  }

  Future<currentUser?> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    print("Auth Result: $authResult");
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
