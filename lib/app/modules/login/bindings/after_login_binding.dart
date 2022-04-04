import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class AfterLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
