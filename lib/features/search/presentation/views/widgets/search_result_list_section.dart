import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_result_list_item.dart';
import 'package:flutter/material.dart';

class SearchResultListSection extends StatelessWidget {
  const SearchResultListSection({
    super.key,
    required this.books,
  });

  final List<SearchedBookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: books.length,
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: SearchResultListItem(book: books[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
