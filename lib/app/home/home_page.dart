import 'dart:async';

import 'package:firebase_user_avatar_flutter/common_widgets/avatar.dart';
import 'package:firebase_user_avatar_flutter/models/avatar_reference.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_storage_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_database.dart';
import 'package:firebase_user_avatar_flutter/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _chooseAvatar(BuildContext context) async {
    try {
      // 1. Get image from picker
      final imagePicker = Provider.of<ImagePickerService>(context);
      final file = await imagePicker.pickImage();
      // 2. Upload to storage
      final storage = Provider.of<FirebaseStorageService>(context);
      final user = Provider.of<User>(context);
      final url = await storage.upload(
        uid: user.uid,
        file: file,
        filename: 'avatar',
      );
      // 3. Save url to Firestore
      final database = Provider.of<FirestoreDatabase>(context);
      await database.setAvatarReference(AvatarReference(url));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _signOut(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: _buildUserInfo(context: context, user: user),
        ),
      ),
    );
  }

  Widget _buildUserInfo({BuildContext context, User user}) {
    // TODO: get Avatar url from Firestore, use in FutureBuilder?
    return Column(
      children: <Widget>[
        InkWell(
          child: Avatar(
            photoUrl: null,
            radius: 50,
            borderColor: Colors.black54,
            borderWidth: 2.0,
          ),
          onTap: () => _chooseAvatar(context),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
