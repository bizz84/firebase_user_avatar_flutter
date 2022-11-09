import 'dart:async';

import 'package:user_avatar_firebase/app/home/about_page.dart';
import 'package:user_avatar_firebase/common_widgets/avatar.dart';
import 'package:user_avatar_firebase/models/avatar_reference.dart';
import 'package:user_avatar_firebase/services/firebase_auth_service.dart';
import 'package:user_avatar_firebase/services/firebase_storage_service.dart';
import 'package:user_avatar_firebase/services/firestore_service.dart';
import 'package:user_avatar_firebase/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onAbout(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const AboutPage(),
      ),
    );
  }

  Future<void> _chooseAvatar(BuildContext context) async {
    final storage = context.read<FirebaseStorageService>();
    final database = Provider.of<FirestoreService>(context, listen: false);

    try {
      // 1. Get image from picker
      final imagePicker =
          Provider.of<ImagePickerService>(context, listen: false);
      final file = await imagePicker.pickImage(source: ImageSource.gallery);

      if (file != null) {
        // 2. Upload to storage
        final downloadUrl = await storage.uploadAvatar(file: file);
        // 3. Save url to Firestore
        await database.setAvatarReference(AvatarReference(downloadUrl));
      }

      // 4. (optional) delete local file as no longer needed
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.help),
          onPressed: () => _onAbout(context),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text(
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
          preferredSize: const Size.fromHeight(130.0),
          child: Column(
            children: <Widget>[
              _buildUserInfo(context: context),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo({required BuildContext context}) {
    final database = Provider.of<FirestoreService>(context, listen: false);
    return StreamBuilder<AvatarReference>(
      stream: database.avatarReferenceStream(),
      builder: (context, snapshot) {
        final avatarReference = snapshot.data;
        return Avatar(
          photoUrl: avatarReference?.downloadUrl,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
          onPressed: () => _chooseAvatar(context),
        );
      },
    );
  }
}
