import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shazely_book/services/ads_service.dart';

class AdsWidgets {
  static Widget bannerWidget() {
    AdsService.createBannerId();
    return AdsService.bannerAd == null
        ? Container()
        : Container(
            margin: const EdgeInsets.all(12),
            height: 50,
            child: AdWidget(
              ad: AdsService.bannerAd!,
              key: UniqueKey(),
            ),
          );
  }
}
