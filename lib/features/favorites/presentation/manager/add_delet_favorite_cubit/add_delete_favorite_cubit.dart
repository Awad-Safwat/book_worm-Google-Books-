import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/favorites/domain/use_cases/add_favorites_use_case.dart';
import 'package:book_worm/features/favorites/domain/use_cases/delete_from_favorites_use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'add_delete_favorite_state.dart';

class AddDeleteFavoriteCubit extends Cubit<AddDeleteFavoriteState> {
  AddDeleteFavoriteCubit({
    required this.addToFavoritesUseCase,
    required this.deleteFromFavoritesUseCase,
  }) : super(AddDeleteFavoriteInitial());

  final AddToFavoritesUseCase addToFavoritesUseCase;
  final DeleteFromFavoritesUseCase deleteFromFavoritesUseCase;

  bool isFavoriteBook = false;

  void checkIsFavoriteBook({required BookEntity book}) {
    if (isFavorite(bookId: book.bookId!)) {
      emit(AddDeleteFavoriteCubitIsFavorite());
      isFavoriteBook = true;
    } else {
      emit(AddDeleteFavoriteCubitIsNotFavorite());
      isFavoriteBook = false;
    }
  }

  void addToFavorites({required String bookId}) async {
    if (await isUserSignedIn()) {
      Either<ServerFalure, void> response =
          await addToFavoritesUseCase.call(bookId);

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(AddDeleteFavoriteCubitNotAuthorized());
          } else {
            emit(AddDeleteFavoriteCubitFailure(faluer: faluer));
          }
        },
        (right) {
          addToFavoritesLocal(bookId: bookId);
          isFavoriteBook = true;
          emit(AddDeleteFavoriteCubitIsFavorite());
        },
      );
    } else {
      emit(AddDeleteFavoriteCubitUserNotSigned());
    }
  }

  void deleteFromFavorites({required String bookId}) async {
    if (await isUserSignedIn()) {
      Either<ServerFalure, void> response =
          await deleteFromFavoritesUseCase.call(bookId);

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(AddDeleteFavoriteCubitNotAuthorized());
          } else {
            emit(AddDeleteFavoriteCubitFailure(faluer: faluer));
          }
        },
        (right) {
          deletAFavoriteLocal(bookId: bookId);
          isFavoriteBook = false;
          emit(AddDeleteFavoriteCubitIsNotFavorite());
        },
      );
    } else {
      emit(AddDeleteFavoriteCubitUserNotSigned());
    }
  }
}
