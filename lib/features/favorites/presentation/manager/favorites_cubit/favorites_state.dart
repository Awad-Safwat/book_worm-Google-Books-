part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesCubitState {}

final class FavoritesCubitInitial extends FavoritesCubitState {}

final class FavoritesCubitLoading extends FavoritesCubitState {}

final class FavoritesCubitSuccess extends FavoritesCubitState {
  final List<BookEntity> books;

  FavoritesCubitSuccess({required this.books});
}

final class FavoritesCubitFailure extends FavoritesCubitState {
  final ServerFalure faluer;

  FavoritesCubitFailure({required this.faluer});
}

final class FavoritesCubitNotAuthorized extends FavoritesCubitState {}

final class FavoritesCubitUserNotSigned extends FavoritesCubitState {}

final class FavoritesCubitAddedSuccess extends FavoritesCubitState {}

final class FavoritesCubitDeletedSuccess extends FavoritesCubitState {}