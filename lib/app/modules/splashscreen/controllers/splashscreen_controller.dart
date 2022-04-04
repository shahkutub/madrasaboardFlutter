import 'dart:async';

import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  @override
  void onInit() {
    print('called');
    Timer(Duration(seconds: 3), () {
      if (Get.find<AuthService>().isAuth) {
        Get.offAllNamed(Routes.AFTER_LOGIN);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }
}