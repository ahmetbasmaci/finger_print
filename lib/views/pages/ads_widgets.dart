import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:finger_print/services/ads_service.dart';

class AdsWidgets {
  static Widget bannerWidget() {
    return FutureBuilder(
      future: AdsService.createBannerId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            margin: const EdgeInsets.all(12),
            height: 50,
            child: AdWidget(
              ad: AdsService.bannerAd!,
              key: UniqueKey(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
            margin: const EdgeInsets.all(12),
            height: 50,
            alignment: Alignment.center,
            color: Colors.grey,
            width: 300,
            child: Text("waiting..", style: TextStyle(color: Colors.white, fontSize: 35)),
          );
        else
          return Container(
            margin: const EdgeInsets.all(12),
            height: 50,
            alignment: Alignment.center,
            color: Colors.grey,
            width: 300,
            child: Text("filed..${snapshot.error}", style: TextStyle(color: Colors.white, fontSize: 35)),
          );
      },
    );
  }
}
