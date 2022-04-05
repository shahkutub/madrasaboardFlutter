import 'package:brac_arna/app/models/InspectionListREsponse.dart';
import 'package:brac_arna/app/models/PoridorshonDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/District.dart';
import '../../../models/Inspection.dart';
import '../../../models/InstituteTypeModel.dart';
import '../../../models/InstitutionDataModel.dart';
import '../../../models/Thana.dart';
import '../../../models/all_division_dis_thanan_model.dart';
import '../../../repositories/information_repository.dart';

class InstituteSearchController extends GetxController {
  //TODO: Implement ProvidedDataListController
  var poridorshonDataModel = new PoridorshonDataModel();
  final count = 0.obs;
  late Box box;
  final dataList = [].obs;
  late GlobalKey<FormState> infoFormKey;
  List<PoridorshonDataModel> poridorshonList = <PoridorshonDataModel>[].obs;
  final inspectionListData = InspectionListREsponse().obs;
  List<Inspection> reversedList =  <Inspection>[].obs;
  final placeLoaded = true.obs;
  var  inspectListPos = 0.obs;

  final allDivDisTana = all_division_dis_thanan_model().obs;
  final allInstype = InstituteTypeModel().obs;
  final instituteData = InstitutionDataModel().obs;

  final pdfUrl = ''.obs;
  final victimDivision = '10'.obs;
  final victimDivisionName = ''.obs;
  final victimDistrict = ''.obs;
  final instituteUpazila = ''.obs;
  final victimUnion = ''.obs;
  final eiinNumber = ''.obs;
  final instituteID = ''.obs;
  final instituteTypeId = ''.obs;

  //List<District> districtList = <District>[].obs;
  List<District> districtList = <District>[].obs;
  List<Thana> thanaList = <Thana>[].obs;
  @override
  Future<void> onInit() async {
    box = Hive.box('formBox');
    //addDataInList();
    getAldivDis();
    getAllInstituteType();
    //getInstitute();



    //getInsPectionListAll();
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

  getAldivDis() async {
    InformationRepository().getDivDisThana().then((resp) {
      allDivDisTana.value = resp;
      if(allDivDisTana.value == null){
        //Get.toNamed(Routes.LOGIN);
      }


    });
  }
  getAllInstituteType() async {
    InformationRepository().getInstituteType().then((resp) {
      allInstype.value = resp;
     // placeLoaded.value = true;
    });
  }

  getInstitute() async {
    InformationRepository().getInstitute(victimDivision.value, victimDistrict.value, instituteUpazila.value, instituteTypeId.value).then((resp) {
      instituteData.value = resp;
      placeLoaded.value = true;
    });
  }
  getInstituteAll() async {
    InformationRepository().getInstituteAll().then((resp) {
      instituteData.value = resp;
      placeLoaded.value = true;
    });
  }


  getInsPectionListDivision() async {

    Map data = {
      "division_id": victimDivision.value.toString(),

      // "division":victimDivision.value,
    };

    InformationRepository().getInspectionList(data).then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;
      reversedList.clear();
      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

      //placeLoaded.value = false;
    });
  }

  getInsPectionListDistrictd() async {

    Map data = {
      "division_id": victimDivision.value.toString(),
      "district_id": victimDistrict.value.toString(),

      // "division":victimDivision.value,
    };

    InformationRepository().getInspectionList(data).then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;
      reversedList.clear();
      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

    });
  }


  getInsPectionListThana() async {

    Map data = {
      "division_id": victimDivision.value.toString(),
      "district_id": victimDistrict.value.toString(),
      "thana_id": instituteUpazila.value.toString(),

      // "division":victimDivision.value,
    };

    InformationRepository().getInspectionList(data).then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;
      reversedList.clear();
      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

    });
  }

  getInsPectionListType() async {

    Map data = {
      "division_id": victimDivision.value.toString(),
      "district_id": victimDistrict.value.toString(),
      "thana_id": instituteUpazila.value.toString(),
      "institute_type": instituteTypeId.value.toString(),

      // "division":victimDivision.value,
    };

    InformationRepository().getInspectionList(data).then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;
      reversedList.clear();
      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

    });
  }

  getInsPectionListInstituteId() async {

    Map data = {
      // "division_id": victimDivision.value.toString(),
      // "district_id": victimDistrict.value.toString(),
      // "thana_id": instituteUpazila.value.toString(),
      // "institute_type": instituteTypeId.value.toString(),
      "institute_id": instituteID.value.toString(),

      // "division":victimDivision.value,
    };

    InformationRepository().getInspectionList(data).then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;

      reversedList.clear();

      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

    });
  }


  getInsPectionListAll() async {

    InformationRepository().getInspectionListAll().then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;
      reversedList.clear();
      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

    });
  }


  launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  String dateFomat(String inputDate)  {
    var inputFormat = DateFormat('yyyy-MM-dd hh:mm');
    var date1 = inputFormat.parse(inputDate);

    var outputFormat = DateFormat('dd-MM-yyyy');
    return outputFormat.format(date1);
  }

}