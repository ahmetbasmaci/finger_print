import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:finger_print/constents/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finger_print/services/ads_service.dart';
import 'package:finger_print/views/pages/ads_widgets.dart';
import '../../constents/my_texts.dart';
import '../../controllers/finger_print_ctr.dart';
import '../../services/theme_service.dart';
import '../components/components.dart';

class FingerPrint extends GetView<ThemeCtr> {
  static const id = 'FingerPrint';

  FingerPrint({super.key});
  FingerPrintCtr fingerPrintCtr = Get.find<FingerPrintCtr>();

  @override
  Widget build(BuildContext context) {
    // if (AdsService.rewardedAd == null) {
    //   AdsService.createRewardedId();
    // } else {
    //   AdsService.rewardedAd?.show(
    //     onUserEarnedReward: (_, reward) {},
    //   );
    // }
    if (AdsService.bannerAd == null) AdsService.createBannerId();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                upPart(),
                bodyPart(),
                footerPart(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              maxBlastForce: 10,
              confettiController: fingerPrintCtr.confettiCtr,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              numberOfParticles: 10,
              gravity: 0.50,
              emissionFrequency: 0.1,
              minimumSize: const Size(2, 2),
              maximumSize: const Size(30, 30),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AdsWidgets.bannerWidget(),
    );
  }

  Widget upPart() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Obx(() => circleWidget(fingerPrintCtr.leftAnswerColor.value)),
          Container(
            width: Get.width * .2,
            height: Get.height * .005,
            color: Colors.yellow,
          ),
          Obx(() => circleWidget(fingerPrintCtr.rigthAnswerColor.value)),
        ],
      ),
    );
  }

  Widget bodyPart() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/answerPlace.png"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 113, 113, 113).withOpacity(.5),
              blurRadius: 50.0,
              spreadRadius: 0.5,
              offset: Offset(1.0, 1.0),
            )
          ],
        ),
        alignment: Alignment.center,
        height: Get.height * 0.6,
        child: Obx(
          () => fingerPrintCtr.isTapping.value
              ? DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: Duration(milliseconds: 10),
                    animatedTexts: [
                      ScaleAnimatedText(AppStrings.processingInspection, duration: Duration(milliseconds: 1500)),
                      ScaleAnimatedText(AppStrings.fingerprintAnalysisInProgress,
                          duration: Duration(milliseconds: 1500)),
                      ScaleAnimatedText(AppStrings.verifyingDingerprint, duration: Duration(milliseconds: 1500)),
                    ],
                  ),
                )
              : MyTexts.main(title: fingerPrintCtr.answer.value, size: 30, color: Colors.yellow),
        ),
      ),
    );
  }

  Widget footerPart() {
    return Expanded(
      flex: 3,
      child: Center(
        child: InkWell(
            onTapDown: (details) => onTapDown(details),
            onTapUp: (details) => onTapUp(details),
            child: fingerPrintPart(
              tappingChild: Obx(
                () => fingerPrintCtr.isTapping.value
                    ? AnimatedPositioned(
                        duration: Duration(milliseconds: 400),
                        top: fingerPrintCtr.tappingProgressTopPosition.value,
                        child: Container(
                          height: Get.height * 0.005,
                          width: Get.width * 0.45,
                          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.yellow.withOpacity(1),
                                spreadRadius: .10,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ),
            )),
      ),
    );
  }

  void onTapDown(TapDownDetails details) async {
    fingerPrintCtr.startTapping();
  }

  void onTapUp(TapUpDetails details) {
    fingerPrintCtr.endTapping();
  }
}
