import 'package:firebase_user_avatar_flutter/app/auth_widget.dart';
import 'package:firebase_user_avatar_flutter/app/auth_widget_builder.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              Provider<FirebaseAuthService>(
                create: (_) => FirebaseAuthService(),
              ),
              Provider<ImagePickerService>(
                create: (_) => ImagePickerService(),
              ),
            ],
            child: AuthWidgetBuilder(builder: (context, userSnapshot) {
              return MaterialApp(
                theme: ThemeData(primarySwatch: Colors.indigo),
                home: AuthWidget(userSnapshot: userSnapshot),
              );
            }),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
