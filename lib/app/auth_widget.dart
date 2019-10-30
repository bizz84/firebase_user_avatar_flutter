import 'package:firebase_user_avatar_flutter/app/home/home_page.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user != null) {
            return Provider<User>.value(
              value: user,
              child: HomePage(),
            );
          }
          return SignInPage();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
