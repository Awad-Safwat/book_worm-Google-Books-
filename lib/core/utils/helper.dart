import 'package:flutter/material.dart';

class AppHelper {
  static Color primaryColor = const Color(0xffde7773);
  static Color darkColor = const Color(0xff171B36);
  static Color secondryColorLight = const Color.fromARGB(255, 255, 255, 255);
  static Color secondryColordark = const Color.fromARGB(255, 112, 112, 112);
  static Color shadowColorLight = const Color.fromARGB(255, 177, 177, 177);
  static Color shadowColordark = const Color.fromARGB(255, 164, 164, 164);

  static Brightness gitBritness(BuildContext context) {
    return MediaQuery.of(context).platformBrightness;
  }
}

const kFeatueredBox = 'featured_Box';
const kNewestBox = 'newest_Box';

