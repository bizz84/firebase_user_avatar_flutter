import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_path.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  FirebaseStorageService({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<String> uploadAvatar({File file}) async => await upload(
        file: file,
        path: FirestorePath.avatar(uid) + '/avatar.png',
        contentType: 'image/png',
      );

  Future<String> upload({File file, String path, String contentType}) async {
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
