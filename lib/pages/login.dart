import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../routes/router.gr.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  var _comunicate = " ";

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginController.text = 'abc@gmail.com';
    _passwordController.text = 'abc123a';

    var _loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_comunicate, style: TextStyle(color: Colors.red)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _loginController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Login',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
        ),
        IconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _loginController.text,
                    password: _passwordController.text);

                context.router.push(MyHomeRoute());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                  setState(() {
                    _comunicate = 'Wrong credentials.';
                  });
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
