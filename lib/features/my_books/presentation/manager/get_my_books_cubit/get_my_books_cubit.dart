import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/my_books/domain/my_books_use_cases/get_my_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_my_books_state.dart';

class GetMyBooksCubit extends Cubit<GetMyBooksState> {
  GetMyBooksCubit({required this.getMyBooksUseCase})
      : super(GetMyBooksInitial());
  final GetMyBooksUseCase getMyBooksUseCase;

  List<BookEntity> booklst = [];
  int pageNumber = 0;
  ScrollController getMyBooksScrollController = ScrollController();
  bool isLoading = false;

  void getMyBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      isLoading = true;
      emit(GetMyBooksCubitLoading());

      if (await isUserSignedIn()) {
        Either<ServerFalure, List<BookEntity>> response =
            await getMyBooksUseCase.call(pageNumber);

        response.fold(
          (faluer) {
            isLoading = false;
            if (faluer.massege == '401') {
              emit(GetMyBooksCubitNotAuthorized());
            } else {
              emit(GetMyBooksCubitFailure(faluer: faluer));
            }
          },
          (books) {
            booklst.addAll(books);
            isLoading = false;
            emit(GetMyBooksCubitSuccess(books: books));
          },
        );
      } else {
        isLoading = false;
        emit(GetMyBooksCubitUserNotSigned());
      }
    } else {
      isLoading = true;
      emit(GetMyBooksCubitPaginationLoading());
      Either<ServerFalure, List<BookEntity>> response =
          await getMyBooksUseCase.call(pageNumber);

      response.fold(
        (faluer) {
          isLoading = false;
          if (faluer.massege == '401') {
            emit(GetMyBooksCubitNotAuthorized());
          } else {
            emit(GetMyBooksCubitPaginationfaluer(
                faluer: ServerFalure(massege: 'No more books')));
          }
        },
        (books) {
          if (books.isNotEmpty) {
            booklst.addAll(books);

            isLoading = false;
            emit(GetMyBooksCubitSuccess(books: books));
          } else {
            isLoading = false;
            emit(GetMyBooksCubitPaginationfaluer(
                faluer: ServerFalure(massege: 'No More Books.')));
          }
        },
      );
    }
  }

  void justEmitLoading() {
    emit(GetMyBooksCubitLoading());
  }

  getMyBooksScrollControllerSetUp(
    BuildContext context,
  ) {
    setupScrollController(context, getMyBooksScrollController, () {
      if (getMyBooksScrollController.position.atEdge) {
        if (getMyBooksScrollController.position.pixels != 0) {
          if (!isLoading) {
            getMyBooks(pageNumber: pageNumber);
          }
        }
      }
    });
  }
}
