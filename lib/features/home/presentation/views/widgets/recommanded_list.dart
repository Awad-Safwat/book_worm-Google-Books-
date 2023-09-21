import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class RecommandedList extends StatelessWidget {
  const RecommandedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: BookImage(),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
