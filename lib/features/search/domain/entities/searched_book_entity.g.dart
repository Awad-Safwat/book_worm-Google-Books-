// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchedBookEntityAdapter extends TypeAdapter<SearchedBookEntity> {
  @override
  final int typeId = 1;

  @override
  SearchedBookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchedBookEntity(
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
  void write(BinaryWriter writer, SearchedBookEntity obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.bookWebViewUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchedBookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
