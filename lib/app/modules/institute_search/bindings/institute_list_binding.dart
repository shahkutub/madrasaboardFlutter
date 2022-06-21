import 'package:get/get.dart';

import '../controllers/institute_search_controller.dart';

class Institute_list_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstituteSearchController>(
      () => InstituteSearchController(),
    );
  }
}
