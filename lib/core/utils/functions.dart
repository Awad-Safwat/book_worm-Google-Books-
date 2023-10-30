import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:book_worm/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/search/data/models/searched_book_model/searched_book_model.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

void saveBooksLocaly<type>(
    {required Set<type> extractedBooksList, required String boxName}) {
  var box = Hive.box<type>(boxName);
  box.addAll(extractedBooksList);
}

void saveUserDataLocaly({required UserEntity userData}) {
  var box = Hive.box<UserEntity>(AppStrings.kHiUserDataBox);
  box.putAt(0, userData);
}

String? getAccessToken() {
  var box = Hive.box<UserEntity>(AppStrings.kHiUserDataBox);
  String accessToken = box.getAt(0)!.userAccessToken.toString();
  print(accessToken);
  return accessToken;
}

// func to extract books from json response to a list
List<BookEntity> extractingMapDataToList(Map<String, dynamic> response) {
  List<BookEntity> extractedBooksList = [];
  for (Map<String, dynamic> element in response['items']) {
    extractedBooksList.add(BookModel.fromJson(element));
  }

  return extractedBooksList;
}

List<SearchedBookEntity> extractingMapDataToListSearchFeature(
    Map<String, dynamic> response) {
  List<SearchedBookEntity> extractedBooksList = [];
  for (Map<String, dynamic> element in response['items']) {
    extractedBooksList.add(SearchedBookModel.fromJson(element));
  }

  return extractedBooksList;
}

void showToast(String massage) {
  Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}

void setupScrollController(BuildContext context,
    ScrollController scrollController, void Function() listenerFunc) {
  scrollController.addListener(listenerFunc);
}
