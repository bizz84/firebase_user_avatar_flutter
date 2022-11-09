import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_avatar_firebase/services/FirebaseCredentialService.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _senhaController = TextEditingController();
  final profile = UserProfile.empty();

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(size: 100),
          const SizedBox(
            height: 50,
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _controller,
                      onSaved: (value) {
                        profile.email = value!;
                      },
                      validator: (value) {
                        if (value == '') {
                          return 'please, enter your email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _senhaController,
                      onSaved: (value) {
                        profile.password = value!;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 10)),
                        ),
                        onPressed: () {
                          final authProvider =
                              context.read<FirebaseCredentialService>();
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print(profile.email + profile.password);
                            final userLogado = authProvider.signIn(profile);
                            userLogado
                                .then((value) => print(value?.user?.email));
                          }
                        },
                        child: const Text('Sign in'))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  // _submit() => _submit();
}
