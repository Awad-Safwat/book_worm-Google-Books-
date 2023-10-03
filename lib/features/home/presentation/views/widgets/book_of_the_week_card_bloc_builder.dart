import 'package:book_worm/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_worm/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookOfTheWeekCardBlocBuilder extends StatelessWidget {
  const BookOfTheWeekCardBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFalure) {
          return Center(
            child: Text(state.massage),
          );
        } else if (state is NewestBooksSucsess) {
          return BookOfTheWeekCard(book: state.books[1]);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
