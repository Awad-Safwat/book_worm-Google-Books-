part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksSucsess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSucsess({required this.books});
}

final class NewestBooksFalure extends NewestBooksState {
  final String massage;

  NewestBooksFalure({required this.massage});
}

final class NewestBooksPaginationLoading extends NewestBooksState {}

final class NewestBooksPaginationFalure extends NewestBooksState {
  final String massage;

  NewestBooksPaginationFalure({required this.massage});
}
