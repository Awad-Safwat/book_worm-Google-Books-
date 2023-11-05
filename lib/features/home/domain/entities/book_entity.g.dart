// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      ratingCount: fields[12] as num?,
      isEbook: fields[11] as bool?,
      buyLinkUrl: fields[10] as String?,
      bookWebViewUrl: fields[9] as String?,
      bookTitle: fields[1] as String?,
      rating: fields[2] as num?,
      numOfReviews: fields[3] as num?,
      imageUrl: fields[4] as String?,
      bookId: fields[0] as String?,
      authorName: fields[5] as String?,
      authorImage: fields[6] as String?,
      bookDiscreption: fields[7] as String?,
      price: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.bookTitle)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.numOfReviews)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.authorName)
      ..writeByte(6)
      ..write(obj.authorImage)
      ..writeByte(7)
      ..write(obj.bookDiscreption)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.bookWebViewUrl)
      ..writeByte(10)
      ..write(obj.buyLinkUrl)
      ..writeByte(11)
      ..write(obj.isEbook)
      ..writeByte(12)
      ..write(obj.ratingCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
