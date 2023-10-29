import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/auth/data/repo_imple/auth_repo_imple.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:book_worm/features/auth/domain/use_case/sign_in_google_use_case.dart';
import 'package:book_worm/features/auth/domain/use_case/sign_in_google_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInGoogleUseCase signInGoogleUseCase;
  final AuthRepoImpel repoImpel;
  SignInCubit({required this.repoImpel, required this.signInGoogleUseCase})
      : super(SignInInitial());

  void signInGoogle() async {
    emit(SignInLoading());
    Either<Faluer, UserEntity> userData = await signInGoogleUseCase.call();

    userData.fold((faluer) {
      emit(SignInFaluer(massage: faluer.massege));
    }, (userData) {
      emit(SignInSuccess(userData: userData));
    });
  }

  Future<bool> canAccessToke() async {
    bool canAccessToken = await repoImpel.canAccessToken();
    return canAccessToken;
  }
}
