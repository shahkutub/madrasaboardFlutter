import 'package:brac_arna/app/models/InspectionListREsponse.dart';
import 'package:brac_arna/app/models/PoridorshonDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../repositories/information_repository.dart';

class ProvidedDataListController extends GetxController {
  //TODO: Implement ProvidedDataListController
  var poridorshonDataModel = new PoridorshonDataModel();
  final count = 0.obs;
  late Box box;
  final dataList = [].obs;
  late GlobalKey<FormState> infoFormKey;
  List<PoridorshonDataModel> poridorshonList = <PoridorshonDataModel>[].obs;
  final inspectionListData = InspectionListREsponse().obs;
  final placeLoaded = false.obs;
  var  inspectListPos = 0.obs;
  @override
  Future<void> onInit() async {
    box = Hive.box('formBox');
    //addDataInList();


    // poridorshonDataModel.date = "00-00-000";
    // poridorshonDataModel.location = "test location";
    // poridorshonDataModel.nameInstitute = "test Institution";
    // poridorshonDataModel.namePoridorshok = "test poridorsok";
    //
    // for (int i = 0; i < 2; i++) {
    //  poridorshonList.add(poridorshonDataModel);
    // }
    getInsPectionList();
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

  getInsPectionList() async {
    InformationRepository().getInspectionList().then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;
      if(inspectionListData.value.inspection_list!.length > 0){

      }

    });
  }

}