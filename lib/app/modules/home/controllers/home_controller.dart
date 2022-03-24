import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  late Box box;
  final dataList = [].obs;
  @override
  Future<void> onInit() async {
    box = Hive.box('formBox');
    addDataInList();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  addDataInList() {
    for (int i = 0; i < box.length; i++) {
      dataList.add(box.get(i));
    }
  }
}
