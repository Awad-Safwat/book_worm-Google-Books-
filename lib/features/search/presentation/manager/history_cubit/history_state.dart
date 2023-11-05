part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistorySucsess extends HistoryState {
  final List<BookEntity> books;

  HistorySucsess({required this.books});
}

final class HistoryFalure extends HistoryState {}
