import 'package:google_sign_in/google_sign_in.dart';

class AppControllers {
  static GoogleSignIn googleSignInController =
      GoogleSignIn(scopes: ["https://www.googleapis.com/auth/books"]);
}
