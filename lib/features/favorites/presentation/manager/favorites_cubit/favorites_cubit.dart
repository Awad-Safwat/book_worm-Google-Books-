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

  void getFavoritesBooks() async {
    emit(FavoritesCubitLoading());

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
  }

  void justEmitLoading() => emit(FavoritesCubitLoading());
}
