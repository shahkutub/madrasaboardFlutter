import 'package:get/get.dart';

import '../controllers/provided_data_list_controller.dart';

class InspectionEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidedDataListController>(
      () => ProvidedDataListController(),
    );
  }
}
