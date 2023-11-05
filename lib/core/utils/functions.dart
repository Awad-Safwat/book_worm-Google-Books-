import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_controllers.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/search/data/models/searched_book_model/searched_book_model.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

void saveBooksLocaly<type>(
    {required Set<type> extractedBooksList, required String boxName}) {
  var box = Hive.box<type>(boxName);
  box.addAll(extractedBooksList);
}

void saveUserDataLocaly({required UserEntity userData}) {
  var box = Hive.box<UserEntity>(AppStrings.kHiUserDataBox);
  if (box.isEmpty) {
    box.add(userData).catchError((er) {
      print(er.toString());
    });
  } else {
    box.putAt(0, userData).catchError((er) {
      print(er.toString());
    });
  }
}

String? getAccessToken() {
  var box = Hive.box<UserEntity>(AppStrings.kHiUserDataBox);
  String accessToken = box.values.first.userAccessToken.toString();
  return accessToken;
}

UserEntity getUserInfo() {
  var box = Hive.box<UserEntity>(AppStrings.kHiUserDataBox);
  return box.values.first;
}

void deletAFavoriteLocal({required String bookId}) {
  var box = Hive.box<String>(AppStrings.kHiFavoritesBox);
  box.delete(bookId);
}

void addToFavoritesLocal({required String bookId}) {
  var box = Hive.box<String>(AppStrings.kHiFavoritesBox);
  box.add(bookId);
}

bool isFavorite({required String bookId}) {
  var box = Hive.box<String>(AppStrings.kHiFavoritesBox);
  bool isFavorit = box.values.contains(bookId);
  return isFavorit;
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

Future<bool> isUserSignedIn() async {
  return await AppControllers.googleSignInController.isSignedIn();
}

Future<void> showSignInDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            FontAwesomeIcons.google,
            size: 45,
          ),
          title: const Text(
            'Sgin In',
            style: Styels.textStyle24,
          ),
          content: const Text('You need to sign in with your google account '),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text("cancel"),
            ),
            MaterialButton(
              color: AppColors.primaryColor,
              onPressed: () async {
                await BlocProvider.of<SignInCubit>(context)
                    .signInGoogle()
                    .then((value) => GoRouter.of(context).pop());
              },
              child: Text(
                'Sign In',
                style: Styels.textStyle16.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      });
}

void launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
    ? await launchUrl(Uri.parse(url))
    : throw 'Could not launch $url';
