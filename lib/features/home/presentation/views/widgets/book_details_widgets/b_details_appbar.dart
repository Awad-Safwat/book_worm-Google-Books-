import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewAppBar extends StatelessWidget {
  const BookDetailsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: const Color(0xff171B36),
      elevation: 0,
      actions: const [
        Icon(
          FontAwesomeIcons.bars,
          size: 28,
        ),
      ],
    );
  }
}
