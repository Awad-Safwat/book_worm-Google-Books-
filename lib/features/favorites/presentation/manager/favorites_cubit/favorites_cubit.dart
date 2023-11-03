import 'package:book_worm/core/utils/app_controllers.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/favorites/domain/use_cases/add_favorites_use_case.dart';
import 'package:book_worm/features/favorites/domain/use_cases/delete_from_favorites_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesCubitState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesCubit({required this.getFavoritesUseCase})
      : super(FavoritesCubitInitial());

  List<BookEntity> booklst = [];
  int pageNumber = 0;
  ScrollController favoritesScrollController = ScrollController();
  bool isLoading = false;

  void getFavoritesBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      isLoading = true;
      emit(FavoritesCubitLoading());

      if (await isUserSignedIn()) {
        Either<ServerFalure, List<BookEntity>> response =
            await getFavoritesUseCase.call(pageNumber);

        response.fold(
          (faluer) {
            isLoading = false;
            if (faluer.massege == '401') {
              emit(FavoritesCubitNotAuthorized());
            } else {
              emit(FavoritesCubitFailure(faluer: faluer));
            }
          },
          (books) {
            booklst.addAll(books);
            isLoading = false;
            print(booklst.length);
            emit(FavoritesCubitSuccess(books: books));
          },
        );
      } else {
        isLoading = false;
        emit(FavoritesCubitUserNotSigned());
      }
    } else {
      isLoading = true;
      emit(FavoritesCubitPaginationLoading());
      Either<ServerFalure, List<BookEntity>> response =
          await getFavoritesUseCase.call(pageNumber);

      response.fold(
        (faluer) {
          isLoading = false;
          if (faluer.massege == '401') {
            emit(FavoritesCubitNotAuthorized());
          } else {
            emit(FavoritesCubitPaginationfaluer(
                faluer: ServerFalure(massege: 'No more books')));
          }
        },
        (books) {
          if (books.isNotEmpty) {
            booklst.addAll(books);

            isLoading = false;
            print(booklst.length);
            emit(FavoritesCubitSuccess(books: books));
          } else {
            isLoading = false;
            emit(FavoritesCubitPaginationfaluer(
                faluer: ServerFalure(massege: 'No More Books.')));
          }
        },
      );
    }
  }

  void justEmitLoading() {
    emit(FavoritesCubitLoading());
  }

  favoritesScrollControllerSetUp(
    BuildContext context,
  ) {
    setupScrollController(context, favoritesScrollController, () {
      if (favoritesScrollController.position.atEdge) {
        if (favoritesScrollController.position.pixels != 0) {
          if (!isLoading) {
            getFavoritesBooks(pageNumber: pageNumber);
          }
        }
      }
    });
  }
}
