import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Faluer, UserEntity>> singInWithGoogle(int isFirstTime);
  void signOut();
}
