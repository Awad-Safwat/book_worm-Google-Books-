import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;
  int pageNumber = 0;
  final ScrollController newestListController = ScrollController();
  List<BookEntity> newestBooksList = [];
  bool paginationIsLoading = false;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      paginationIsLoading = true;
      emit(NewestBooksPaginationLoading());
    }

    Either<ServerFalure, List<BookEntity>> books =
        await newestBooksUseCase.call(pageNumber);

    books.fold((faluer) {
      if (pageNumber == 0) {
        emit(NewestBooksFalure(massage: faluer.massege));
      } else {
        emit(NewestBooksPaginationFalure(massage: faluer.massege));
      }
    }, (books) {
      print(books.first.buyLinkUrl.toString());
      newestBooksList.addAll(books);
      paginationIsLoading = false;
      emit(NewestBooksSucsess(books: books));
    });
  }
}
