import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:book_worm/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpel extends AuthRepo {
  static GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ["https://www.googleapis.com/auth/books"]);

  @override
  void signOut() {
    googleSignIn.disconnect();
  }

  @override
  Future<Either<ServerFalure, UserEntity>> singInWithGoogle(
      int isFirstTime) async {
    try {
      GoogleSignInAccount? account =
          await googleSignIn.signIn().catchError((er) {
        return left(ServerFalure(massege: er.toString()));
      });
      GoogleSignInAuthentication? accountAuth =
          await account?.authentication.catchError((er) {
        return left(ServerFalure(massege: er.toString()));
      });

      UserEntity userData = UserEntity(
        userName: account!.displayName!,
        email: account.email,
        userImageUrl: account.photoUrl!,
        userAccessToken: accountAuth!.accessToken!,
      );
      saveUserDataLocaly(userData: userData);
      return right(userData);
    } catch (error) {
      return left(
        ServerFalure(
          massege: error.toString(),
        ),
      );
    }
  }

  @override
  Future<bool> canAccessToken() async {
    String? accessToken = getAccessToken();

    var canAccess = await googleSignIn.canAccessScopes(
        ["https://www.googleapis.com/auth/books"],
        accessToken: accessToken);

    return canAccess;
  }
}
