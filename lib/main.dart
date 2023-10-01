import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'constents/app_settings.dart';
import 'constents/controllers_binding.dart';
import 'services/theme_service.dart';
import 'views/pages/finger_print_page.dart';
import 'views/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      navigatorKey: AppSettings.navigatorKey,
      locale: Locale("ar"),
      routes: {
        HomePage.id: (context) => HomePage(), //'/${HomePage.id}'
        FingerPrint.id: (context) => FingerPrint(),
      },
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeCtr().lightThemeMode.value,
      darkTheme: ThemeCtr().darkThemeMode.value,
      themeMode: ThemeMode.light,
    );
  }
}
