import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AuthorDataCard extends StatelessWidget {
  const AuthorDataCard({
    super.key,
    required this.aoutherName,
  });
  final String aoutherName;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      shadowColor: Colors.grey,
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                Text(
                  aoutherName,
                  style: Styels.textStyle18,
                ),
                const Text(
                  'Best Seller of New York Times',
                  style: Styels.textStyle8,
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.star))
          ],
        ),
      ),
    );
  }
}
