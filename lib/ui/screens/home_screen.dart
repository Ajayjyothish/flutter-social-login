import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login/mangers/auth_manger.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(FirebaseAuth.instance.currentUser!.email!),
        MaterialButton(
          padding: const EdgeInsets.all(10),
          color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Text(
            'LOG OUT',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          onPressed: () {
            // 	log out the current user upon pressing the logoun button
            AuthManger.signout();
          },
        ),
      ],
    );
  }
}
