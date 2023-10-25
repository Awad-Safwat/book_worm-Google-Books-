import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ["https://www.googleapis.com/auth/books"]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () async {
            await googleSignIn.signIn().then((result) {
              result!.authentication.then((googleKey) {
                print(googleKey.accessToken);
                print(googleKey.idToken);
                print(result.displayName);
                print(result.email);
                print(result.id);
              }).catchError((er) {
                print(er);
              });
            }).catchError((er) {
              print(er);
            });
            GoogleSignIn(scopes: []);
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
