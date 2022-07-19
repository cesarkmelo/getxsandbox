import 'package:get/get.dart';
import 'package:getsandbox/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(
        () => const HomePage(),
        transition: Transition.circularReveal,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
    print('llamado antes de borrar el widget');
  }
}
