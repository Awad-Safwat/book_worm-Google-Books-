part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntity userData;

  SignInSuccess({required this.userData});
}

final class SignInFaluer extends SignInState {
  final String massage;

  SignInFaluer({required this.massage});
}
