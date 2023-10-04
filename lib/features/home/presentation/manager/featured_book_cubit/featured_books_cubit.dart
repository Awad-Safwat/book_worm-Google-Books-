import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/use_cases/fetch_featchered_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featcheredBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeatcheredBooksUseCase featcheredBooksUseCase;

  List<BookEntity> featuredBooksLst = [];

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Faluer, List<BookEntity>> books =
        await featcheredBooksUseCase.call();

    books.fold((faluer) {
      emit(FeaturedBooksFalure(massage: faluer.massege));
    }, (books) {
      featuredBooksLst = books;
      emit(FeaturedBooksSucsess(books: books));
    });
  }
}
