import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/auth/data/repo_imple/auth_repo_imple.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase extends UseCase<void, NoParam> {
  final AuthRepoImpel authRepoImpel;

  SignOutUseCase({required this.authRepoImpel});
  @override
  Future<Either<ServerFalure, void>> call([NoParam? param]) {
    // TODO: implement call
    return authRepoImpel.signOut();
  }
}
