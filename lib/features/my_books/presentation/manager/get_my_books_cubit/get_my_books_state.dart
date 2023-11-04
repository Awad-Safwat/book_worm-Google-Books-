part of 'get_my_books_cubit.dart';

@immutable
sealed class GetMyBooksState {}

final class GetMyBooksInitial extends GetMyBooksState {}

final class GetMyBooksCubitLoading extends GetMyBooksState {}

final class GetMyBooksCubitSuccess extends GetMyBooksState {
  final List<BookEntity> books;

  GetMyBooksCubitSuccess({required this.books});
}

final class GetMyBooksCubitFailure extends GetMyBooksState {
  final ServerFalure faluer;

  GetMyBooksCubitFailure({required this.faluer});
}

final class GetMyBooksCubitNotAuthorized extends GetMyBooksState {}

final class GetMyBooksCubitUserNotSigned extends GetMyBooksState {}

final class GetMyBooksCubitPaginationLoading extends GetMyBooksState {}

final class GetMyBooksCubitPaginationfaluer extends GetMyBooksState {
  final ServerFalure faluer;

  GetMyBooksCubitPaginationfaluer({required this.faluer});
}
