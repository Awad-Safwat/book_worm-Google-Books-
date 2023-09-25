import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/b_details_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 350,
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
            ],
          ),
        ),
      ],
    );
  }
}
