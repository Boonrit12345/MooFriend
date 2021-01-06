import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moofriend/utility/dialog.dart';
import 'package:moofriend/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text('New Register'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildUser(),
            buildPassword(),
            buildLogin(),
          ],
        ),
      ),
    );
  }

  Container buildLogin() {
    return Container(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space? Please Fill Every Blank');
          } else {
            checkAuthen();
          }
        },
        child: Text('Login'),
      ),
    );
  }

  Container buildUser() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => email = value.trim(),
        keyboardType: TextInputType.emailAddress,
        decoration: Mystyle().inputDecoration(
          'User',
          Icon(Icons.email),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: true,
        decoration: Mystyle().inputDecoration(
          'Password',
          Icon(Icons.lock),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/myservice', (route) => false))
          .catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
