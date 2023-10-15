import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_result_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListSection extends StatelessWidget {
  const SearchResultListSection({
    super.key,
    required this.books,
  });

  final List<SearchedBookEntity> books;

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    setupScrollController(context, searchCubit.scrollController, () {
      if (searchCubit.scrollController.position.atEdge) {
        if (searchCubit.scrollController.position.pixels != 0) {
          if (!searchCubit.isLoading) {
            searchCubit.fetchSearchedBooks(
                searchCubit.textEditingController.value.text.toString(),
                pageNumber: searchCubit.pageNumber);
          }
        }
      }
    });

    return Expanded(
      child: CustomScrollView(
        controller: searchCubit.scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
