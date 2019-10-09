import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_user_avatar_flutter/models/avatar_reference.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_path.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  // Sets the avatar download url
  Future<void> setAvatarReference({
    @required String uid,
    @required AvatarReference avatarReference,
  }) async {
    final path = FirestorePath.avatar(uid);
    final reference = Firestore.instance.document(path);
    await reference.setData(avatarReference.toMap());
  }

  // Reads the current avatar download url
  Stream<AvatarReference> avatarReferenceStream({
    @required String uid,
  }) {
    final path = FirestorePath.avatar(uid);
    final reference = Firestore.instance.document(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => AvatarReference.fromMap(snapshot.data));
  }
}
