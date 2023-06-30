import 'package:get/get.dart';
import '../controllers/audio_ctr.dart';
import '../controllers/finger_print_ctr.dart';
import '../controllers/home_ctr.dart';
import '../services/theme_service.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ThemeCtr());
    Get.put(HomePageCtr());
    Get.put(FingerPrintCtr());
    Get.put(AudioCtr());
  }
}
