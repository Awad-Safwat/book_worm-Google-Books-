import 'package:book_worm/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/featured_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatueredBooksListBlocBuilder extends StatelessWidget {
  const FeatueredBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFalure) {
          return Center(
            child: Text(state.massage),
          );
        } else if (state is FeaturedBooksSucsess) {
          return FeatueredBooksList(
            books: state.books,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
