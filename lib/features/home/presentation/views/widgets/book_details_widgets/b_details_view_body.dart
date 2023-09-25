import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/b_details_appbar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/selected_book_card.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: screenSize.height * .38,
          width: screenSize.width,
          decoration: const BoxDecoration(
            color: Color(0xff171B36),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          child: Stack(
            children: [
              Positioned.directional(
                textDirection: TextDirection.ltr,
                width: screenSize.width - 30,
                height: 100,
                top: 15,
                start: 10,
                child: const BookDetailsViewAppBar(),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                height: screenSize.height * .18,
                top: screenSize.height * .14,
                start: screenSize.width * .11,
                child: const SizedBox(
                  child: SelectedBookCard(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
