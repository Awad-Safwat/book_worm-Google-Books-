import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/b_details_appbar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/selected_book_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenSize.height * .28,
            width: screenSize.width,
            decoration: const BoxDecoration(
              color: Color(0xff171B36),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  height: screenSize.height * .16,
                  top: screenSize.height * .05,
                  start: screenSize.width * .11,
                  child: const SizedBox(
                    child: SelectedBookCard(),
                  ),
                ),
                Positioned.directional(
                  height: screenSize.height * 0.11,
                  width: screenSize.width * 0.81,
                  start: screenSize.width * .09,
                  top: screenSize.height * .23,
                  textDirection: TextDirection.ltr,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    shadowColor: Colors.grey,
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            foregroundImage: AssetImage(AssetsData.personImage),
                            radius: 25,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Author',
                                style: Styels.textStyle10
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              const Text(
                                'Morgan Housel',
                                style: Styels.textStyle18,
                              ),
                              const Text(
                                'Best Seller of New York Times',
                                style: Styels.textStyle8,
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.star))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
