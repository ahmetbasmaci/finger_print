import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:confetti/confetti.dart';
import 'package:finger_print/constents/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finger_print/constents/my_texts.dart';
import 'package:finger_print/models/enums.dart';
import '../constents/my_colors.dart';
import 'audio_ctr.dart';

class FingerPrintCtr extends GetxController {
  RxString answer = "".obs;
  final Color _defaultAnswerColor = Color.fromARGB(255, 208, 208, 208);
  final Color _tureAnswerColor = Color.fromARGB(255, 0, 147, 32);
  final Color _falseAnswerColor = Color.fromARGB(255, 147, 0, 0);

  Rx<Color> leftAnswerColor = Color.fromARGB(255, 208, 208, 208).obs;
  Rx<Color> rigthAnswerColor = Color.fromARGB(255, 208, 208, 208).obs;

  RxBool isTapping = false.obs;
  int tappingSecondCounter = 0;
  int tappingMaxSecond = 4;
  RxDouble tappingProgressTopPosition = 0.0.obs;
  double progressMaxPositionValue = Get.width * 0.45;
  ConfettiController confettiCtr = ConfettiController(duration: Duration(seconds: 1));
  bool get isWillGetAnswer => tappingSecondCounter == tappingMaxSecond;

  void setAnswer() async {
    isTapping.value = false;
    tappingSecondCounter = 0;

    int random = Random().nextInt(2); //0-1
    AudioType audioType = random == 1 ? AudioType.correct : AudioType.wrong;
    if (random == 1) {
      answer.value = AppStrings.congratulationsYouAreSincere;
      animateAnswerColor(_tureAnswerColor);

      confettiCtr.play();
    } else {
      answer.value = AppStrings.youAreALiar;
      animateAnswerColor(_falseAnswerColor);
    }
    Get.find<AudioCtr>().playAudio(audioType);
    await showDialog();
    confettiCtr.stop();
  }

  void startTapping() async {
    isTapping.value = true;
    answer.value = "";
    tappingSecondCounter = 0;
    leftAnswerColor.value = _defaultAnswerColor;
    rigthAnswerColor.value = _defaultAnswerColor;
    updateTappingProgressPosition();
    while (isTapping.value) {
      if (isWillGetAnswer) {
        setAnswer();
        break;
      }
      tappingSecondCounter++;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void updateTappingProgressPosition() async {
    while (isTapping.value) {
      if (tappingProgressTopPosition.value < progressMaxPositionValue)
        tappingProgressTopPosition.value += progressMaxPositionValue;
      else
        tappingProgressTopPosition.value = 0.0;

      await Future.delayed(Duration(milliseconds: 400));
    }
  }

  void endTapping() {
    isTapping.value = false;
    if (isWillGetAnswer) {
      setAnswer();
    }
  }

  Future<void> showDialog() async {
    await Get.defaultDialog(
      title: AppStrings.examinationResults,
      backgroundColor: MyColors.backgroundDark,
      content: Column(
        children: [
          Text(answer.value, style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          AnimatedButton(
            color: MyColors.primary(),
            //width: MySiezes.btnIcon,
            height: Get.height * 0.05,
            onPressed: () => Get.back(),
            child: MyTexts.main(
              title: AppStrings.close,
              color: MyColors.whiteBlackReversed(),
            ),
          )
        ],
      ),
    );
  }

  void animateAnswerColor(Color answerColor) async {
    Color nextColor = answerColor;
    for (var i = 1; i <= 5; i++) {
      if (i % 2 == 1)
        nextColor = answerColor;
      else
        nextColor = _defaultAnswerColor;

      leftAnswerColor.value = nextColor;
      rigthAnswerColor.value = nextColor;
      await Future.delayed(Duration(milliseconds: 40 * i));
    }
  }
}
