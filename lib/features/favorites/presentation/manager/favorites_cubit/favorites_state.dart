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

final class FavoritesCubitPaginationLoading extends FavoritesCubitState {}

final class FavoritesCubitPaginationfaluer extends FavoritesCubitState {
  final ServerFalure faluer;

  FavoritesCubitPaginationfaluer({required this.faluer});
}
