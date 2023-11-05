part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSucces extends SearchState {
  final List<BookEntity> books;

  SearchSucces({required this.books});
}

final class SearchLoading extends SearchState {}

final class SearchPaginationLoading extends SearchState {}

final class SearchFaluer extends SearchState {
  final String massage;

  SearchFaluer({required this.massage});
}

final class SearchPaginationFaluer extends SearchState {
  final String massage;

  SearchPaginationFaluer({required this.massage});
}
