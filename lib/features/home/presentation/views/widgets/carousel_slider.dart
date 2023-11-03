import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderList extends StatelessWidget {
  final List<BookEntity> books;
  final Size size;

  const CarouselSliderList(
      {super.key, required this.books, required this.size});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int index, int page) =>
          BookOfTheWeekCard(
              book: books[books.length - 1 - index], screenSize: size),
      options: CarouselOptions(
        height: size.height * 0.20,
        clipBehavior: Clip.none,
        autoPlay: true,
        padEnds: true,
        // enlargeCenterPage: true,
        // enlargeFactor: 10,
      ),
    );
  }
}
