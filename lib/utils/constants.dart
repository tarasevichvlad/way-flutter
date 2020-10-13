import 'package:flutter/material.dart';

class Constants {
  static const String BASE_SCHEMA = "https://";
  static const String BASE_URL_DOMAIN = "way-stage.azurewebsites.net";
  static String getBaseUrl() {
    return BASE_SCHEMA + BASE_URL_DOMAIN;
  }

  static TextStyle textStyle30 = TextStyle(
      fontFamily: 'Comic Sans MS',
      fontSize: 30,
      color: const Color(0xff12616a));

  static TextStyle textStyle18 = TextStyle(
      fontFamily: 'Comic Sans MS',
      fontSize: 18,
      color: const Color(0xff12616a));

  static TextStyle textStyle14 = TextStyle(
      fontFamily: 'Comic Sans MS',
      fontSize: 14,
      color: const Color(0xff12616a));
  static Color baseColor = const Color(0xff12616a);
  static Color whiteColor = Colors.white;
  static Color greyColor = Color.fromRGBO(245, 245, 243, 100);
}
