import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_hooks/flutter_hooks.dart';

import '../routes/router.gr.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final errorTextState = useState(" ");
    var loginTextController = useTextEditingController(text: 's@gmail.com');
    var passwordTextController = useTextEditingController(text: 'abc123');

    var _loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorTextState.value, style: TextStyle(color: Colors.red)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: loginTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Login',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: passwordTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
          ),
        ),
        IconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: loginTextController.text,
                    password: passwordTextController.text);

                context.router.push(MyHomeRoute());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'invalid-email' ||
                    e.code == 'user-not-found' ||
                    e.code == 'wrong-password') {
                  errorTextState.value = 'Wrong credentials.';
                }
              }
            },
            icon: Icon(Icons.login)),
      ],
    );
    return Scaffold(
      body: kIsWeb
          ? Row(
              children: [
                Expanded(child: const SizedBox()),
                Expanded(
                  child: _loginForm,
                ),
                Expanded(child: const SizedBox()),
              ],
            )
          : _loginForm,
    );
  }
}
