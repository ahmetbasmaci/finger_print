import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shazely_book/constents/my_colors.dart';
import 'package:shazely_book/constents/my_texts.dart';
import 'package:shazely_book/services/theme_service.dart';
import 'package:shazely_book/views/pages/finger_print_page.dart';

import '../components/components.dart';

class HomePage extends GetView<ThemeCtr> {
  static const id = 'HomePage';
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundDark,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mainBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            fingerPrintPart(),
            MyTexts.main(
              title: "جهاز كشف الكذب",
              color: Colors.white,
              size: 30.0,
              fontWeight: FontWeight.bold,
            ),
            AnimatedButton(
              height: Get.height * 0.1,
              width: Get.width * 0.8,
              color: MyColors.backgroundDark,
              onPressed: () {
                Get.to(FingerPrint());
              },
              child: MyTexts.main(
                title: "إبدأ الآن",
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
