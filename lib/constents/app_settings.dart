import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Create a key to can open drawer

  static FocusScopeNode focusScopeNode = FocusScopeNode();

  static get isArabicLang => Get.locale!.languageCode == 'ar';

  //write method take arabic name  as paraemter and return that string without every tashkil char and hamza
  static String removeTashkil(String text) {
    String withOutTashkill = text
        .replaceAll('َ', '')
        .replaceAll('ً', '')
        .replaceAll('ُ', '')
        .replaceAll('ٌ', '')
        .replaceAll('ِ', '')
        .replaceAll('ٍ', '')
        .replaceAll('ْ', '')
        .replaceAll('ّ', '')
        .replaceAll('ٰ', '')
        .replaceAll('ۡ', '')
        .replaceAll('ٓ', '')
        .replaceAll('آ', 'ا')
        .replaceAll('ٱ', 'ا');
    return withOutTashkill;
  }
}
