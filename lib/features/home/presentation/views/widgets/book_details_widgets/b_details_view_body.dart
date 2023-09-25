import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/author_data_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/b_details_appbar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/selected_book_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * .28,
            width: screenSize.width,
            decoration: const BoxDecoration(
              color: Color(0xff171B36),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  height: screenSize.height * .16,
                  top: screenSize.height * .05,
                  start: screenSize.width * .11,
                  child: const SizedBox(
                    child: SelectedBookCard(),
                  ),
                ),
                Positioned.directional(
                  height: screenSize.height * 0.11,
                  width: screenSize.width * 0.81,
                  start: screenSize.width * .09,
                  top: screenSize.height * .23,
                  textDirection: TextDirection.ltr,
                  child: const AuthorDataCard(),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: screenSize.width * .10,
              top: screenSize.height * 0.10,
              left: screenSize.width * .10,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About The Book',
                  style: Styels.textStyle18,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "'The Psychology of Money' is an essential read for anyone interested in being better with money. Fast-paced and engaging, this book will help you refine your thoughts towards money. You can finish this book in a week, unlike other books that are too lengthy."
                  "                                                                                                                                                                                                                       "
                  "The most important emotions in relation to money are fear, guilt, shame and envy. It's worth spending some effort to become aware of the emotions that are especially tied to money for you because, without awareness, they will tend to override rational thinking and drive your actions.'",
                  style: Styels.textStyle14,
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
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
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (contxt, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kBookDetailsView);
                            },
                            child: const BookImage()),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
