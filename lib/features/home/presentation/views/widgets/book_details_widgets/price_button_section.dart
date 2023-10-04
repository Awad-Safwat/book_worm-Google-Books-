import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/grab_now_button.dart';
import 'package:flutter/material.dart';

class PriceButtonSection extends StatelessWidget {
  const PriceButtonSection({
    super.key,
    required this.screenSize,
    required this.book,
  });
  final BookEntity book;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(blurRadius: .5)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Text(
                r"$ 45.5",
                style: Styels.textStyle18.copyWith(color: Colors.black),
              ),
              const Spacer(),
              GrabNowButton(
                buttonHeight: 45,
                buttonWidth: screenSize.width * .45,
                topLeftRadius: 0,
                bottomLeftRadius: 0,
                topRightRadius: 15,
                bottomRightRadius: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
