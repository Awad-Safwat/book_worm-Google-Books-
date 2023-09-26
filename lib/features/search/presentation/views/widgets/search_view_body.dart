import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 25,
              ),
              enabledBorder: myInputBorder(context),
              focusedBorder: myInputBorder(context),
            ),
          )
        ],
      ),
    ));
  }

  OutlineInputBorder myInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }
}
