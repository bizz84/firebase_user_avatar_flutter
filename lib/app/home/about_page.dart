import 'package:user_avatar_firebase/common_widgets/avatar.dart';
import 'package:user_avatar_firebase/models/avatar_reference.dart';
import 'package:user_avatar_firebase/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Advanced Provider Tutorials',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 32),
            Text(
              'by Andrea Bizzotto',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 32),
            Text(
              'codingwithflutter.com',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
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
          photoUrl: avatarReference!.downloadUrl,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
        );
      },
    );
  }
}
