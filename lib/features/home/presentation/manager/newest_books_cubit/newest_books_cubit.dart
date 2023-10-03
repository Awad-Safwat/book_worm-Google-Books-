import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    Either<Faluer, List<BookEntity>> books = await newestBooksUseCase.call();

    books.fold((faluer) {
      emit(NewestBooksFalure(massage: faluer.massege));
    }, (books) {
      emit(NewestBooksSucsess(books: books));
    });
  }
}
