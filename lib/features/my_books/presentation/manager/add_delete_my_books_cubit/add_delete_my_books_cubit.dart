import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/my_books/domain/my_books_use_cases/add_to_my_books_use_case.dart';
import 'package:book_worm/features/my_books/domain/my_books_use_cases/delete_from_my_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'add_delete_my_books_state.dart';

class AddDeleteMyBooksCubit extends Cubit<AddDeleteMyBooksState> {
  AddDeleteMyBooksCubit(
      {required this.addToMyBooksUseCase,
      required this.deleteFromMyBooksUseCase})
      : super(AddDeleteMyBooksInitial());
  final AddToMyBooksUseCase addToMyBooksUseCase;
  final DeleteFromMyBooksUseCase deleteFromMyBooksUseCase;

  void addToMyBooks({required String bookId}) async {
    if (await isUserSignedIn()) {
      Either<ServerFalure, void> response =
          await addToMyBooksUseCase.call(bookId);

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(AddDeleteMyBooksNotAuthorized());
          } else {
            emit(AddDeleteMyBooksFailure(faluer: faluer));
          }
        },
        (right) {
          //addToMyBooksLocal(bookId: bookId);
          emit(AddDeleteMyBooksAddedSuccess());
        },
      );
    } else {
      emit(AddDeleteMyBooksUserNotSigned());
    }
  }

  void deleteFromMyBooks({required String bookId}) async {
    if (await isUserSignedIn()) {
      Either<ServerFalure, void> response =
          await deleteFromMyBooksUseCase.call(bookId);

      response.fold(
        (faluer) {
          if (faluer.massege == '401') {
            emit(AddDeleteMyBooksNotAuthorized());
          } else {
            emit(AddDeleteMyBooksFailure(faluer: faluer));
          }
        },
        (right) {
          // deletAFavoriteLocal(bookId: bookId);

          emit(AddDeleteMyBooksDeletedSuccess());
        },
      );
    } else {
      emit(AddDeleteMyBooksUserNotSigned());
    }
  }
}
