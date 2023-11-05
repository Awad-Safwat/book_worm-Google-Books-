import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:flutter/material.dart';

class AbouTheBookSection extends StatelessWidget {
  const AbouTheBookSection({
    super.key,
    required this.screenSize,
    required this.book,
  });
  final dynamic book;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: screenSize.width * .10,
        left: screenSize.width * .10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About The Book',
            style: Styels.textStyle18,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            book.bookDiscreption ?? 'no discreption found',
            style: Styels.textStyle14,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                launchURL(book.bookWebViewUrl ?? '');
              },
              child: Text(
                'Read Sample..',
                style: Styels.textStyle18.copyWith(color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
