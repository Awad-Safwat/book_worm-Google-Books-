import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/pobular_list_item.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Search Result',
            style: Styels.textStyle18,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 100,
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: PobularListItem(),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
