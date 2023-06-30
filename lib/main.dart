import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constents/app_settings.dart';
import 'constents/controllers_binding.dart';
import 'services/theme_service.dart';
import 'views/pages/finger_print_page.dart';
import 'views/pages/home_page.dart';

void main() async {
  //await AppSettings.setMechineCode();
  //await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(MyLocalCtr());
  //Get.put(ThemeCtr());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      navigatorKey: AppSettings.navigatorKey,
      //builder: BotToastInit(), //1. call BotToastInit
      // navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer
      locale: Locale("ar"),
      //locale: Get.find<MyLocalCtr>().currentLocal,
      // translations: MyLocale(),
      routes: {
        HomePage.id: (context) => HomePage(), //'/${HomePage.id}'
        FingerPrint.id: (context) => FingerPrint(),
      },
       home: HomePage(),
      //initialRoute: HomePage.id,
      // initialRoute: HelperMethods.isInDebugMode ? HelperMethods.getNewOpendPageId() : SplashPage.id,
      debugShowCheckedModeBanner: false,
      theme: ThemeCtr().lightThemeMode.value,
      darkTheme: ThemeCtr().darkThemeMode.value,
      themeMode: ThemeMode.light,
    );
  }
}
