import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Book of the week',
              style: Styels.textStyle20,
            ),
            centerTitle: true,
            actions: const [
              Icon(
                FontAwesomeIcons.bars,
                size: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
