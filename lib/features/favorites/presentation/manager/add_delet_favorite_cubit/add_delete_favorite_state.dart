part of 'add_delete_favorite_cubit.dart';

@immutable
sealed class AddDeleteFavoriteState {}

final class AddDeleteFavoriteInitial extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteCubitFailure extends AddDeleteFavoriteState {
  final ServerFalure faluer;

  AddDeleteFavoriteCubitFailure({required this.faluer});
}

final class AddDeleteFavoriteCubitNotAuthorized
    extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteCubitUserNotSigned
    extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteCubitAddedSuccess extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteCubitIsFavorite extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteCubitIsNotFavorite
    extends AddDeleteFavoriteState {}

final class AddDeleteFavoriteCubitDeletedSuccess
    extends AddDeleteFavoriteState {}
