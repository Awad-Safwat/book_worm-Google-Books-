part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSucsess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSucsess({required this.books});
}

final class FeaturedBooksFalure extends FeaturedBooksState {
  final String massage;

  FeaturedBooksFalure({required this.massage});
}
