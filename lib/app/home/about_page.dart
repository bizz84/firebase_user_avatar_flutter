import 'package:firebase_user_avatar_flutter/common_widgets/avatar.dart';
import 'package:firebase_user_avatar_flutter/models/avatar_reference.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: Column(
            children: <Widget>[
              _buildUserInfo(context: context),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Advanced Provider Tutorials',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 32),
            Text(
              'by Andrea Bizzotto',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 32),
            Text(
              'codingwithflutter.com',
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo({BuildContext context}) {
    final database = Provider.of<FirestoreService>(context);
    final user = Provider.of<User>(context);
    return StreamBuilder<AvatarReference>(
      stream: database.avatarReferenceStream(uid: user.uid),
      builder: (context, snapshot) {
        final avatarReference = snapshot.data;
        return Avatar(
          photoUrl: avatarReference?.downloadUrl,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
        );
      },
    );
  }
}
