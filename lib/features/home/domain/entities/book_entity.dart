import 'dart:core';
import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? bookTitle;
  @HiveField(2)
  final num? rating;
  @HiveField(3)
  final num? numOfReviews;
  @HiveField(4)
  final String? imageUrl;
  @HiveField(5)
  final String? authorName;
  @HiveField(6)
  final String? authorImage;
  @HiveField(7)
  final String? bookDiscreption;
  @HiveField(8)
  final String? price;
  @HiveField(9)
  final String? bookWebViewUrl;
  @HiveField(10)
  final String? buyLinkUrl;
  @HiveField(11)
  final bool? isEbook;
  @HiveField(12)
  final num? ratingCount;

  BookEntity({
    required this.ratingCount,
    required this.isEbook,
    required this.buyLinkUrl,
    required this.bookWebViewUrl,
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

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
