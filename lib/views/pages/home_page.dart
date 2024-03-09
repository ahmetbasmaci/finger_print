import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constents/my_texts.dart';
import 'ads_widgets.dart';
import 'finger_print_page.dart';

import '../../constents/app_strings.dart';
import '../../constents/my_colors.dart';
import '../../services/ads_service.dart';
import '../components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (AdsService.bannerAd == null) AdsService.createBannerId();
    if (AdsService.rewardedAd == null) AdsService.createRewardedId();
  }

  @override
  void dispose() {
    AdsService.disposeAds();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (AdsService.rewardedAd == null) {
    //   AdsService.createRewardedId();
    // } else {
    //   AdsService.rewardedAd?.show(
    //     onUserEarnedReward: (_, reward) {},
    //   );
    // }
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
            //  AdsWidgets.bannerWidget(),
            fingerPrintPart(),
            MyTexts.main(
              title: AppStrings.lieDetectorDevice,
              color: Colors.white,
              size: 30.0,
              fontWeight: FontWeight.bold,
            ),
            AnimatedButton(
              height: Get.height * 0.1,
              width: Get.width * 0.8,
              color: MyColors.backgroundDark,
              onPressed: () {
                if (AdsService.rewardedAd == null) {
                  AdsService.createRewardedId();
                }
                try {
                  AdsService.rewardedAd!.show(onUserEarnedReward: (_, reward) {
                    Get.to(FingerPrint());
                  });
                } catch (e) {
                  Get.to(FingerPrint());
                }
              },
              child: MyTexts.main(
                title: AppStrings.startNow,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdsWidgets.bannerWidget(),
    );
  }
}
