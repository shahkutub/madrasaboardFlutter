import 'package:get/get.dart';

import '../controllers/provided_data_list_controller.dart';

class single_inspectionView extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidedDataListController>(
      () => ProvidedDataListController(),
    );
  }
}
