import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatueredBooksList extends StatelessWidget {
  const FeatueredBooksList({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    final scrollController =
        BlocProvider.of<FeaturedBooksCubit>(context).scrollController;

    setupScrollController(
      context,
      scrollController,
      () {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
                pageNumber:
                    BlocProvider.of<FeaturedBooksCubit>(context).pageNumber++);
          }
        }
      },
    );

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.16,
      child: ListView.builder(
        controller: scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppStrings.kBookDetailsView, extra: books[index]);
                },
                child: BookImage(imageUrl: books[index].imageUrl ?? '')),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
