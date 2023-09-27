import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/about_the_book_section.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/price_button_section.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/may_like_section.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/selected_with_author_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookWithAuthorSection(screenSize: screenSize),
          SizedBox(
            height: screenSize.height * 0.10,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AbouTheBookSection(screenSize: screenSize),
                  PriceButtonSection(screenSize: screenSize),
                  MayAlsoLikeSection(screenSize: screenSize),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
