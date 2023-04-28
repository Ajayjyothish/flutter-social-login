import 'package:flutter/material.dart';
import 'package:social_login/services/facebook_auth.dart';
import 'package:social_login/services/google_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            GoogleAuth.signIn();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: const Text("Sign In with Google"),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              final creds = await FacebookAuthService.signIn();
            } catch (e) {
              showDialog(
                  context: context,
                  builder: ((context) => AlertDialog(
                        content: Text(e.toString()),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'))
                        ],
                      )));
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: const Text("Sign In with Facebook"),
        ),
      ],
    );
  }
}
