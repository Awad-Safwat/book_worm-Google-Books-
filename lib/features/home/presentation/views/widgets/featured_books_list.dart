import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatueredBooksList extends StatelessWidget {
  const FeatueredBooksList({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRouter.kBookDetailsView, extra: books[index]);
                },
                child: BookImage(imageUrl: books[index].imageUrl!)),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
