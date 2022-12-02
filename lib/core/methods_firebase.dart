import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_perawat/pages/LoginRegister/login_pages.dart';

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then(
      (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginPage(),
          ),
        );
      },
    );
  } catch (e) {
    print("error");
  }
}