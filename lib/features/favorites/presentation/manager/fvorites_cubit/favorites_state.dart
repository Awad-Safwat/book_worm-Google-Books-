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
  final String massage;

  FavoritesCubitFailure({required this.massage});
}
