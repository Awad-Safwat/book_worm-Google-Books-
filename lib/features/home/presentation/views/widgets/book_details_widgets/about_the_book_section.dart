import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AbouTheBookSection extends StatelessWidget {
  const AbouTheBookSection({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: screenSize.width * .10,
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
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
