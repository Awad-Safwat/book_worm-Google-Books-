part of 'add_delete_my_books_cubit.dart';

@immutable
sealed class AddDeleteMyBooksState {}

final class AddDeleteMyBooksInitial extends AddDeleteMyBooksState {}

final class AddDeleteMyBooksFailure extends AddDeleteMyBooksState {
  final ServerFalure faluer;

  AddDeleteMyBooksFailure({required this.faluer});
}

final class AddDeleteMyBooksNotAuthorized extends AddDeleteMyBooksState {}

final class AddDeleteMyBooksUserNotSigned extends AddDeleteMyBooksState {}

final class AddDeleteMyBooksAddedSuccess extends AddDeleteMyBooksState {}

final class AddDeleteMyBooksDeletedSuccess extends AddDeleteMyBooksState {}
