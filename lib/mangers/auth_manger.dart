import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login/services/facebook_auth.dart';
import 'package:social_login/services/google_auth.dart';
import 'package:social_login/ui/screens/home_screen.dart';
import 'package:social_login/ui/screens/login_screen.dart';

class AuthManger {
  static StreamBuilder handleState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData ? const Home() : const Login();
        });
  }

  static signout() {
    FirebaseAuth.instance.signOut();
    GoogleAuth.signout();
    FacebookAuthService.signout();
  }
}
