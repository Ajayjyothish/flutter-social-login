import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static Future<UserCredential?> signIn() async {
    final GoogleSignInAccount? account = await GoogleSignIn().signIn();
    if (account != null) {
      final GoogleSignInAuthentication authToken = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authToken.accessToken,
        idToken: authToken.idToken,
      );
      try {
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } on FirebaseAuthException catch (error) {
        throw (error.message ?? error.code);
      }
    }
    return null;
  }

  static signout() {
    GoogleSignIn().signOut();
  }
}
