import 'package:get/get.dart';

import '../controllers/provided_data_list_controller.dart';

class ProvidedDataListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidedDataListController>(
      () => ProvidedDataListController(),
    );
  }
}
