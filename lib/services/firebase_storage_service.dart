import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_path.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  /// Upload an avatar from file
  Future<String> uploadAvatar({
    @required String uid,
    @required File file,
  }) async =>
      await upload(
        uid: uid,
        file: file,
        path: FirestorePath.avatar(uid) + '/avatar.png',
        contentType: 'image/png',
      );

  /// Generic file upload for any [path] and [contentType]
  Future<String> upload({
    @required String uid,
    @required File file,
    @required String path,
    @required String contentType,
  }) async {
    print('uploading to: $path');
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
        file, StorageMetadata(contentType: contentType));
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error != null) {
      print('upload error code: ${snapshot.error}');
      throw snapshot.error;
    }
    // Url used to download file/image
    final downloadUrl = await snapshot.ref.getDownloadURL();
    print('downloadUrl: $downloadUrl');
    return downloadUrl;
  }
}
