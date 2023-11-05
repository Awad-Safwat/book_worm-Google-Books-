import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/read_now_button.dart';
import 'package:flutter/material.dart';

class PriceButtonSection extends StatelessWidget {
  const PriceButtonSection({
    super.key,
    required this.screenSize,
    required this.book,
  });
  final dynamic book;
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
                (book.isEbook!)
                    ? (book.price == '0' || book.price == null)
                        ? 'free'
                        : '${book.price!} EGP'
                    : 'Not for sale',
                style: Styels.textStyle18.copyWith(color: Colors.black),
              ),
              const Spacer(),
              ReadNowButton(
                buttonHeight: 45,
                buttonWidth: screenSize.width * .45,
                topLeftRadius: 0,
                bottomLeftRadius: 0,
                topRightRadius: 15,
                bottomRightRadius: 15,
                book: book,
                buttonText: 'Buy Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
