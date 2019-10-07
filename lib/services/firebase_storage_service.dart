import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_path.dart';

class FirebaseStorageService {
  Future<String> upload({String uid, File file, String filename}) async {
    final path = FirestorePath.avatar(uid) + '/$filename.png';
    print('uploading: $path');
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
        file, StorageMetadata(contentType: 'image/png'));
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error != null) {
      print('upload error code: ${snapshot.error}');
      throw snapshot.error;
    }
    if (snapshot.storageMetadata != null) {
      print('upload success: ${snapshot.storageMetadata.path}');
    }
    return snapshot.storageMetadata?.path;
  }
}
