import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MayAlsoLikeSection extends StatelessWidget {
  const MayAlsoLikeSection({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    var featuredBooksList = BlocProvider.of<FeaturedBooksCubit>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width * .10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You may also like ..',
            style: Styels.textStyle18,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              scrollDirection: Axis.horizontal,
              itemBuilder: (contxt, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppStrings.kBookDetailsView,
                          extra: featuredBooksList.featuredBooksLst[index]);
                    },
                    child: BookImage(
                        imageUrl: featuredBooksList
                            .featuredBooksLst[index].imageUrl!),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
