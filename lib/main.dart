import 'package:firebase_core/firebase_core.dart';
import 'package:user_avatar_firebase/app/auth_widget.dart';
import 'package:user_avatar_firebase/app/auth_widget_builder.dart';
import 'package:user_avatar_firebase/app/login/auth_login.dart';
import 'package:user_avatar_firebase/services/firebase_auth_service.dart';
import 'package:user_avatar_firebase/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'services/FirebaseCredentialService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        Provider<ImagePickerService>(
          create: (_) => ImagePickerService(),
        ),
        Provider(create: (_) => FirebaseCredentialService(),
        )
      ],
      child: AuthWidgetBuilder(builder: (context, userSnapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.indigo),
          home: Login(),
        );
      }),
    );
  }
}
