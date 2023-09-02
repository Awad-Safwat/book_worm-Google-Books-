import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:flutter/material.dart';

class OnBoardingPageBodyItem extends StatelessWidget {
  const OnBoardingPageBodyItem({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
    required this.supTitle,
  });

  final double height;
  final double width;
  final Image image;
  final String title;
  final String supTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              TextButton(
                child: Text(
                  'skip',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            width: width,
            height: height * .53,
            child: image,
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.black,
            indent: width * .04,
            endIndent: width * .04,
          ),
          SizedBox(
            height: height * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .08),
            child: Container(
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text(
                    supTitle,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
