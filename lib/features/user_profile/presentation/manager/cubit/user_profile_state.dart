part of 'user_profile_cubit.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileIsNotSigned extends UserProfileState {}

final class UserProfileIsSigned extends UserProfileState {}

final class UserProfileIsNotAuthorized extends UserProfileState {}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileSuccess extends UserProfileState {
  final UserEntity user;

  UserProfileSuccess({required this.user});
}
