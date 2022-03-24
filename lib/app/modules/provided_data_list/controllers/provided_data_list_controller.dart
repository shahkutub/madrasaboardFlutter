import 'package:brac_arna/app/models/PoridorshonDataModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProvidedDataListController extends GetxController {
  //TODO: Implement ProvidedDataListController
  var poridorshonDataModel = new PoridorshonDataModel();
  final count = 0.obs;
  late Box box;
  final dataList = [].obs;
  List<PoridorshonDataModel> poridorshonList = <PoridorshonDataModel>[].obs;
  @override
  Future<void> onInit() async {
    box = Hive.box('formBox');
    addDataInList();


    poridorshonDataModel.date = "00-00-000";
    poridorshonDataModel.location = "test location";
    poridorshonDataModel.nameInstitute = "test Institution";
    poridorshonDataModel.namePoridorshok = "test poridorsok";

    for (int i = 0; i < 2; i++) {
     poridorshonList.add(poridorshonDataModel);
    }

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