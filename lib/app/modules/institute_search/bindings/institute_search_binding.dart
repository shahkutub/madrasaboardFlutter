import 'package:get/get.dart';

import '../controllers/institute_search_controller.dart';

class institute_search_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstituteSearchController>(
      () => InstituteSearchController(),
    );
  }
}
