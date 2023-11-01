import 'package:book_worm/core/utils/app_controllers.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/favorites/domain/use_cases/add_favorites_use_case.dart';
import 'package:book_worm/features/favorites/domain/use_cases/delete_from_favorites_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesCubitState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final DeleteFromFavoritesUseCase deleteFromFavoritesUseCase;
  FavoritesCubit(
      {required this.addToFavoritesUseCase,
      required this.deleteFromFavoritesUseCase,
      required this.getFavoritesUseCase})
      : super(FavoritesCubitInitial());

  List<BookEntity> booklst = [];

  void getFavoritesBooks() async {
    emit(FavoritesCubitLoading());
    if (await isUserSignedIn()) {
      Either<ServerFalure, List<BookEntity>> response =
          await getFavoritesUseCase.call();

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(FavoritesCubitNotAuthorized());
          } else {
            emit(FavoritesCubitFailure(faluer: faluer));
          }
        },
        (books) {
          booklst = books;
          emit(FavoritesCubitSuccess(books: books));
        },
      );
    } else {
      emit(FavoritesCubitUserNotSigned());
    }
  }

  void justEmitLoading() => emit(FavoritesCubitLoading());

  void addToFavorites() async {
    emit(FavoritesCubitLoading());
    if (await isUserSignedIn()) {
      Either<ServerFalure, void> response = await addToFavoritesUseCase.call();

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(FavoritesCubitNotAuthorized());
          } else {
            emit(FavoritesCubitFailure(faluer: faluer));
          }
        },
        (right) {
          emit(FavoritesCubitAddedSuccess());
        },
      );
    } else {
      emit(FavoritesCubitUserNotSigned());
    }
  }

  void deleteFromFavorites() async {
    emit(FavoritesCubitLoading());
    if (await isUserSignedIn()) {
      Either<ServerFalure, void> response =
          await deleteFromFavoritesUseCase.call();

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(FavoritesCubitNotAuthorized());
          } else {
            emit(FavoritesCubitFailure(faluer: faluer));
          }
        },
        (right) {
          emit(FavoritesCubitDeletedSuccess());
        },
      );
    } else {
      emit(FavoritesCubitUserNotSigned());
    }
  }
}
