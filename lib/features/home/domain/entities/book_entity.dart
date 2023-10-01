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

  BookEntity(
    this.bookTitle,
    this.rating,
    this.numOfReviews,
    this.imageUrl,
    this.bookId,
    this.authorName,
    this.authorImage,
    this.bookDiscreption,
    this.price,
  );
}
