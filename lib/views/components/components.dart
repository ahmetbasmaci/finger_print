import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constents/my_colors.dart';

Widget circleWidget(Color asnwerColor) {
  return Container(
    width: Get.width * 0.33,
    height: Get.width * 0.23,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromARGB(255, 233, 233, 233),
    ),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: asnwerColor,
          border: Border.all(color: Colors.black, width: 2.0),
          boxShadow: [
            BoxShadow(
              color: asnwerColor,
              blurRadius: 20.0,
              spreadRadius: 0.5,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget fingerPrintPart({Widget tappingChild = const SizedBox()}) {
  return Container(
    width: Get.width * 0.5,
    height: Get.width * 0.5,
    decoration: BoxDecoration(
      color: MyColors.backgroundDark,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(.5),
          spreadRadius: .1,
          blurRadius: 10,
        ),
      ],
    ),
    child: Stack(
      children: [
        Center(
          child: SizedBox(
            height: Get.width * 0.3,
            width: Get.width * 0.2,
            child: Image.asset(
              "assets/images/fingerPrint2.png",
              color: const Color.fromARGB(255, 0, 255, 8),
              width: Get.width * 0.2,
              height: Get.width * 0.2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        tappingChild,
      ],
    ),
  );
}
