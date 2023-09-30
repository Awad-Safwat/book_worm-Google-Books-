import 'dart:core';

class BookEntity {
  final num bookId;
  final String bookTitle;
  final num rating;
  final num numOfReviews;
  final String imageUrl;
  final String authorName;
  final String authorImage;
  final String bookDiscreption;
  final num price;

  BookEntity({
    required this.bookTitle,
    required this.rating,
    required this.numOfReviews,
    required this.imageUrl,
    required this.bookId,
    required this.authorName,
    required this.authorImage,
    required this.bookDiscreption,
    required this.price,
  });
}
