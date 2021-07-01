import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/models/avatar_reference.dart';
import 'package:vendor_app/services/firestore_path.dart';

class FirestoreService {
  FirestoreService({required this.uid});
  final String uid;

  // Sets the avatar download url
  Future<void> setAvatarReference(AvatarReference avatarReference) async {
    final path = FirestorePath.avatar(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(avatarReference.toMap());
  }

  // Reads the current avatar download url
  Stream<AvatarReference> avatarReferenceStream() {
    final path = FirestorePath.avatar(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => AvatarReference.fromMap(snapshot.data()));
  }
}
