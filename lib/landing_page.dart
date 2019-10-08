import 'package:firebase_user_avatar_flutter/app/home/home_page.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

/// Builds the signed-in or non signed-in UI, depending on the user snapshot
class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    print('LandingPage rebuild');
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? HomePage() : SignInPage();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
