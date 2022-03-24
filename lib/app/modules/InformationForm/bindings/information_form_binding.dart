import 'package:get/get.dart';

import '../controllers/information_form_controller.dart';

class InformationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationFormController>(
      () => InformationFormController(),
    );
  }
}
