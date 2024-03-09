// ignore_for_file: unused_field, constant_identifier_names

import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsService {
  static bool get _isTestMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static const String _appTestId = "ca-app-pub-3940256099942544~3347511713";
  static const String _bannerTestId = "ca-app-pub-3940256099942544/6300978111";
  static const String _interstitialTestId = "ca-app-pub-3940256099942544/1033173712";
  static const String _rewardTestId = "ca-app-pub-3940256099942544/5224354917";

  static const String _appId_android = "ca-app-pub-8440997669688345~2341588342";
  static const String _bannerId_android = "ca-app-pub-8440997669688345/8510005900";
  static const String _interstitialId_android = "ca-app-pub-8440997669688345/5079432324";
  static const String _rewardId_android = "ca-app-pub-8440997669688345/8827105644";

  static BannerAd? bannerAd;
  static RewardedAd? rewardedAd;

  static String get appId {
    if (_isTestMode) return _appTestId;

    if (Platform.isAndroid)
      return _appId_android;
    else if (Platform.isIOS) return "";
    return throw UnsupportedError("Unsupported platform");
  }

  static String get bannerId {
    if (_isTestMode) return _bannerTestId;

    if (Platform.isAndroid)
      return _bannerId_android;
    else if (Platform.isIOS) return "";
    return throw UnsupportedError("Unsupported platform");
  }

  static String get interstitialId {
    if (_isTestMode) return _interstitialTestId;

    if (Platform.isAndroid)
      return _interstitialId_android;
    else if (Platform.isIOS) return "";
    return throw UnsupportedError("Unsupported platform");
  }

  static String get rewardedId {
    if (_isTestMode) return _rewardTestId;

    if (Platform.isAndroid)
      return _rewardId_android;
    else if (Platform.isIOS) return "";
    return throw UnsupportedError("Unsupported platform");
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      print('Ad failed to load: $error');
    },
    onAdOpened: (Ad ad) => print('Ad opened.'),
    onAdClosed: (Ad ad) => print('Ad closed.'),
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );
  static final RewardedAdLoadCallback rewardedAdListener = RewardedAdLoadCallback(
    onAdLoaded: (RewardedAd ad) {
      print('$ad loaded.');
      // Keep a reference to the ad so you can show it later.
      rewardedAd = ad;
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) => print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          rewardedAd?.dispose();
          rewardedAd = null;
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          rewardedAd?.dispose();
          rewardedAd = null;
        },
        onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
      );
    },
    onAdFailedToLoad: (LoadAdError error) {
      print('RewardedAd failed to load: $error');
    },
  );

  static Future<void> createBannerId() async {
    bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: bannerId,
      listener: bannerAdListener,
      request: AdRequest(),
    )..load();
    // await bannerAd?.load();
    await Future.delayed(Duration(seconds: 1));
  }

  static void createRewardedId() async {
    await RewardedAd.load(
      adUnitId: rewardedId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          rewardedAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (RewardedAd ad) => print('$ad onAdShowedFullScreenContent.'),
            onAdDismissedFullScreenContent: (RewardedAd ad) {
              print('$ad onAdDismissedFullScreenContent.');
              ad.dispose();
              createRewardedId();
            },
            onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
              print('$ad onAdFailedToShowFullScreenContent: $error');
              ad.dispose();
              createRewardedId();
            },
            onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  static void disposeAds() {
    // bannerAd?.dispose();
    // rewardedAd?.dispose();
    bannerAd = null;
    rewardedAd = null;
  }
}
