import 'package:bloc/bloc.dart';
import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/use_cases/fetch_featchered_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featcheredBooksUseCase)
      : super(FeaturedBooksInitial());
  //

  final FetchFeatueredBooksUseCase featcheredBooksUseCase;

  List<BookEntity> featuredBooksLst = [];

  final scrollController = ScrollController();

  int pageNumber = 1;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }

    Either<Faluer, List<BookEntity>> books =
        await featcheredBooksUseCase.call(pageNumber);

    books.fold(
      (faluer) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFalure(massage: faluer.massege));
        } else {
          emit(
            FeaturedBooksPaginationFalure(massage: faluer.massege),
          );
        }
      },
      (books) {
        featuredBooksLst.addAll(books);
        emit(FeaturedBooksSucsess(books: books));
      },
    );
  }
}
