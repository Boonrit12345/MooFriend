import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moofriend/models/usermodel.dart';
import 'package:moofriend/utility/dialog.dart';
import 'package:moofriend/utility/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, email, password;

  Container buildName() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        keyboardType: TextInputType.text,
        decoration: Mystyle().inputDecoration(
          'Display Name',
          Icon(Icons.fingerprint),
        ),
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
        obscureText: false,
        decoration: Mystyle().inputDecoration(
          'Password',
          Icon(Icons.lock),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if ((email?.isEmpty ?? true) ||
              (password?.isEmpty ?? true) ||
              (name?.isEmpty ?? true)) {
            normalDialog(context, 'Have space ? \nPlease Fill Every Blank');
          } else {
            registerAndInsertUser();
          }
        },
        child: Icon(Icons.cloud),
      ),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 100),
            buildName(),
            buildUser(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  Future<Null> registerAndInsertUser() async {
    await Firebase.initializeApp().then((value) async {
      print('initial Success');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String uid = value.user.uid;
        print('Register Success ==> uid = $uid');
        await value.user.updateProfile(displayName: name).then((value) async {
          UserModel model = UserModel(email: email, name: name, uid: uid);
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('user')
              .doc(uid)
              .set(data)
              .then((value) => Navigator.pop(context));
        });
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
