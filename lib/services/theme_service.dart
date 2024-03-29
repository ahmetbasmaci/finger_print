// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constents/enums.dart';
import '../constents/my_colors.dart';
import '../constents/my_sizes.dart';

class ThemeCtr extends GetxController {
  ThemeCtr() {
    updateThemes();
  }
  //write regin block
  //region
  TextStyle bodySmall_main = TextStyle();
  TextStyle bodySmall_quran = TextStyle();
  TextStyle bodyMedium_zikrTitle = TextStyle();
  TextStyle displaySmall_content = TextStyle();
  TextStyle bodyLarge_blockTitle = TextStyle();
  TextStyle labelSmall_settingsTitle = TextStyle();
  TextStyle labelMedium_settingContent = TextStyle();
  TextStyle headLine6_headers = TextStyle();
  TextStyle displayMedium_Info = TextStyle();
  TextStyle displayLarge_dropDownItem = TextStyle();
  TextStyle titleSmall_dropDownTitle = TextStyle();
  TextStyle titleLarge_outsideCard = TextStyle();

  //endregion

  RxBool isDarkMode = false.obs;
  Rx<ThemeData> lightThemeMode = ThemeData.light().obs;
  Rx<ThemeData> darkThemeMode = ThemeData.dark().obs;
  Rx<ThemeData> currentThemeMode = ThemeData().obs;
  void updateThemes() {

    updateTextStyles();

    lightThemeMode.value = ThemeData.light().copyWith(
      timePickerTheme: TimePickerThemeData(
        dialHandColor: MyColors.primary(),
        dayPeriodBorderSide: BorderSide(color: MyColors.primary(), width: 1),
      ),
      primaryColor: MyColors.primary_,
      scaffoldBackgroundColor: MyColors.backgroundLight,
      drawerTheme: DrawerThemeData(backgroundColor: MyColors.backgroundLight),
      iconTheme: IconThemeData(color: MyColors.primary_, size: MySiezes.icon),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyColors.primary_, elevation: 10),
      indicatorColor: MyColors.primary_,
      bottomAppBarTheme: BottomAppBarTheme(color: MyColors.primary_),
      listTileTheme: ListTileThemeData(
        selectedColor: MyColors.primary_,
        iconColor: MyColors.primary_,
        textColor: MyColors.black,
        selectedTileColor: MyColors.primary_.withOpacity(.8),
      ),
      sliderTheme: SliderThemeData(valueIndicatorColor: MyColors.backgroundLight),
      appBarTheme: AppBarTheme(
        color: MyColors.backgroundLight,
        iconTheme: IconThemeData(color: MyColors.primary_, size: MySiezes.icon),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.primary_),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.primary_),
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 199, 5, 5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: MyColors.primary_,
        onPrimary: MyColors.primary_,
        secondary: MyColors.primary_,
        onSecondary: MyColors.primary_,
        error: MyColors.primary_,
        onError: MyColors.primary_,
        background: MyColors.backgroundLight,
        onBackground: MyColors.backgroundLight,
        surface: MyColors.backgroundLight,
        onSurface: MyColors.black,
        shadow: Colors.transparent,
      ),
      textTheme: TextTheme(
        bodySmall: bodySmall_main.copyWith(color: Colors.black),
        bodyMedium: bodyMedium_zikrTitle.copyWith(color: MyColors.primary_),
        bodyLarge: bodyLarge_blockTitle,
        labelSmall: labelSmall_settingsTitle.copyWith(color: MyColors.settingsTitle),
        labelMedium: labelMedium_settingContent.copyWith(color: MyColors.settingsContent),
        labelLarge: headLine6_headers.copyWith(color: MyColors.white), //default
        displaySmall: displaySmall_content.copyWith(color: MyColors.content),
        displayMedium: displayMedium_Info.copyWith(color: MyColors.info),
        displayLarge: displayLarge_dropDownItem.copyWith(color: MyColors.black),
        titleSmall: titleSmall_dropDownTitle.copyWith(color: MyColors.primary_),
        titleMedium: bodySmall_quran.copyWith(color: MyColors.primary_),
        titleLarge: titleLarge_outsideCard.copyWith(color: MyColors.primary_),
      ),
    );

    darkThemeMode.value = ThemeData.dark().copyWith(
      timePickerTheme: TimePickerThemeData(
        dialHandColor: MyColors.primary(),
        dayPeriodBorderSide: BorderSide(color: MyColors.primary(), width: 1),
      ),
      primaryColor: MyColors.primaryDark,
      scaffoldBackgroundColor: MyColors.backgroundDark,
      drawerTheme: DrawerThemeData(backgroundColor: MyColors.backgroundDark),
      iconTheme: IconThemeData(color: MyColors.primaryDark, size: MySiezes.icon),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyColors.primaryDark, elevation: 10),
      indicatorColor: MyColors.primaryDark,
      listTileTheme: ListTileThemeData(
        selectedColor: MyColors.primaryDark,
        iconColor: MyColors.primaryDark,
        textColor: MyColors.white,
        selectedTileColor: MyColors.primaryDark.withOpacity(.8),
      ),
      sliderTheme: SliderThemeData(valueIndicatorColor: MyColors.backgroundDark),
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.backgroundDark,
        iconTheme: IconThemeData(color: MyColors.primaryDark, size: MySiezes.icon),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.primaryDark),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.primaryDark),
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 64, 183, 206)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: MyColors.primaryDark,
        onPrimary: MyColors.primaryDark,
        secondary: MyColors.primaryDark,
        onSecondary: MyColors.primaryDark,
        error: MyColors.primaryDark,
        onError: MyColors.primaryDark,
        background: MyColors.backgroundDark,
        onBackground: MyColors.backgroundDark,
        surface: MyColors.backgroundDark,
        onSurface: MyColors.white,
        shadow: Colors.transparent,
      ),
      textTheme: TextTheme(
        bodySmall: bodySmall_main.copyWith(color: Colors.white),
        bodyMedium: bodyMedium_zikrTitle.copyWith(color: MyColors.primaryDark),
        bodyLarge: bodyLarge_blockTitle,
        labelSmall: labelSmall_settingsTitle.copyWith(color: MyColors.white),
        labelMedium: labelMedium_settingContent.copyWith(color: MyColors.settingsContentDark),
        labelLarge: headLine6_headers.copyWith(color: MyColors.white, shadows: []),
        displaySmall: displaySmall_content.copyWith(color: MyColors.contentDark),
        displayMedium: displayMedium_Info.copyWith(color: MyColors.info),
        displayLarge: displayLarge_dropDownItem.copyWith(color: MyColors.white),
        titleSmall: titleSmall_dropDownTitle.copyWith(color: MyColors.primaryDark),
        titleMedium: bodySmall_quran.copyWith(color: MyColors.white),
        titleLarge: titleLarge_outsideCard.copyWith(color: MyColors.primaryDark),
      ),
    );
  }

  void updateTextStyles() {
    String defaultFontMain = MyFonts.uthmanic.name;
    bodySmall_main = TextStyle(
      fontSize: 20,
      height: 1.8,
      wordSpacing: 5.5,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontMain,
    );
    bodySmall_quran = TextStyle(
      fontSize: 20,
      height: 1.8,
      wordSpacing: 5.5,
      fontWeight: FontWeight.w500,
      fontFamily: defaultFontMain,
    );
    bodyMedium_zikrTitle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: defaultFontMain,
    );
    displaySmall_content = TextStyle(
      fontSize: 17,
      height: 1.8,
      wordSpacing: 3.5,
      fontFamily: defaultFontMain,
    );

    bodyLarge_blockTitle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: defaultFontMain,
    );

    labelSmall_settingsTitle = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      fontFamily: defaultFontMain,
    );

    labelMedium_settingContent = TextStyle(
      fontSize: 14,
      color: MyColors.settingsContent,
      fontFamily: defaultFontMain,
    );

    headLine6_headers = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: defaultFontMain,
    );
    titleLarge_outsideCard = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: defaultFontMain,
    );

    displayMedium_Info = TextStyle(
      fontSize: 17,
      color: MyColors.info,
      wordSpacing: 3.5,
      fontFamily: defaultFontMain,
    );

    displayLarge_dropDownItem = TextStyle(
      fontFamily: defaultFontMain,
    );

    titleSmall_dropDownTitle = TextStyle(
      fontSize: 20,
      fontFamily: defaultFontMain,
    );
  }

}
