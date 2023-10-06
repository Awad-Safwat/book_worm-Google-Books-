import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/domain/use_cases/fetch_searched_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchSearchedBooksUseCase) : super(SearchInitial());

  final FetchSearchedBooksUseCase fetchSearchedBooksUseCase;

  fetchSearchedBooks(String? searchKey) async {
    emit(SearchLoading());
    if (searchKey!.isEmpty) {
      emit(SearchFaluer(massage: ''));
    }
    Either<Faluer, List<SearchedBookEntity>> books =
        await fetchSearchedBooksUseCase.call(searchKey);
    books.fold((faluer) {
      emit(SearchFaluer(massage: faluer.massege));
    }, (booksList) {
      emit(SearchSucces(books: booksList));
    });
  }
}
