import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/b_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final dynamic book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff171B36),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: Icon(
              FontAwesomeIcons.bars,
              size: 23,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              size: 23,
            ),
          ),
        ),
      ),
      body: BookDetailsViewBody(
        book: book,
      ),
    );
  }
}
