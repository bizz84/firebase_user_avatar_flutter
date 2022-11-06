import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:user_avatar_firebase/services/firestore_path.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  FirebaseStorageService({required this.uid});
  final String uid;

  /// Upload an avatar from file
  Future<String> uploadAvatar({
    required File file,
  }) async =>
      await upload(
        file: file,
        path: '${FirestorePath.avatar(uid)}/avatar.png',
        contentType: 'image/png',
      );

  /// Generic file upload for any [path] and [contentType]
  Future<String> upload({
    required File file,
    required String path,
    required String contentType,
  }) async {
    print('uploading to: $path');
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
        file, SettableMetadata(contentType: contentType));
    
    // Url used to download file/image
    final downloadUrl = await uploadTask.snapshot.ref.getDownloadURL();
    print('downloadUrl: $downloadUrl');
    return downloadUrl;
  }
}
