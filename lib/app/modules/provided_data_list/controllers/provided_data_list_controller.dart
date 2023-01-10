
import 'package:brac_arna/app/models/InspectionListREsponse.dart';
import 'package:brac_arna/app/models/PoridorshonDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/ui.dart';
import '../../../models/District.dart';
import '../../../models/Inspection.dart';
import '../../../models/Inspection_model.dart';
import '../../../models/InspectorListResponse.dart';
import '../../../models/InstituteTypeModel.dart';
import '../../../models/InstitutionDataModel.dart';
import '../../../models/PostResponse.dart';
import '../../../models/Thana.dart';
import '../../../models/all_division_dis_thanan_model.dart';
import '../../../repositories/information_repository.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../../routes/app_pages.dart';
class ProvidedDataListController extends GetxController {
  //TODO: Implement ProvidedDataListController
  var poridorshonDataModel = new PoridorshonDataModel();
  final count = 0.obs;
  late Box box;
  final dataList = [].obs;
  late GlobalKey<FormState> infoFormKey;
  List<PoridorshonDataModel> poridorshonList = <PoridorshonDataModel>[].obs;
  final inspectionListData = InspectionListREsponse().obs;
  List<Inspection> reversedList =  <Inspection>[].obs;
  final placeLoaded = false.obs;
  var  inspectListPos = 0.obs;

  final allDivDisTana = all_division_dis_thanan_model().obs;
  final allInstype = InstituteTypeModel().obs;
  final instituteData = InstitutionDataModel().obs;
  final insPectorListRespponse = InspectorListResponse().obs;

  final pdfUrl = ''.obs;
  final victimDivision = ''.obs;
  final victimDivisionName = ''.obs;
  final victimDistrict = ''.obs;
  final instituteUpazila = ''.obs;
  final victimUnion = ''.obs;
  final eiinNumber = ''.obs;
  final instituteID = ''.obs;
  final inspectorID = '1'.obs;
  final instituteTypeId = ''.obs;

  List<District> districtList = <District>[].obs;
  List<Thana> thanaList = <Thana>[].obs;
  var selectedDate = DateTime.now().obs;
  final fromDate = 'তারিখ হইতে'.obs;
  final toDate = 'তারিখ পর্যন্ত'.obs;

  var fromDateEditController = TextEditingController().obs;
  var toDateEditController = TextEditingController().obs;

  var hintTextDistrict = "জেলা নির্বাচন করুন".obs;
  var hintTextUpojela = "উপজেলা নির্বাচন করুন".obs;


  final Rx<Inspection_model> inspectionData = Inspection_model().obs;
  final inspectorIdList = [].obs;
  final inspectorIdListJson = ''.obs;
  final IsInternet = 0.obs;
  final IsOnlineClass = 0.obs;
  final IsGurdianMeeting = 0.obs;
  final IsTecherTraining = 0.obs;
  final IsCleanActivity = 0.obs;
  final IsElectricity = 0.obs;
  final postResponse = PostResponse().obs;
  @override
  Future<void> onInit() async {
    box = Hive.box('formBox');
    //addDataInList();
    getInstitute();
    getAldivDis();
    getAllInstituteType();

    getInsPectionListAll();
    //getInsPectionListByInspectorId();
    getAllInspector();
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


  getAllInspector() async {
    InformationRepository().getInsPectorList().then((resp) {
      insPectorListRespponse.value = resp;
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
    InformationRepository().getInstitute(victimDivision.value, victimDistrict.value, instituteUpazila.value, instituteTypeId.value).then((resp) {
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


  getInsPectionListDateRange() async {
    //reversedList.clear();
    Map data = {
      // "division_id": victimDivision.value.toString(),
      // "district_id": victimDistrict.value.toString(),
      // "thana_id": instituteUpazila.value.toString(),
      // "institute_type": instituteTypeId.value.toString(),
      "date_range": fromDate.value+'~'+toDate.value,

      // "division":victimDivision.value,
    };

    InformationRepository().getInspectionList(data).then((resp) {
      //  allStudentData.value = resp;
      inspectionListData.value = resp;
      placeLoaded.value = true;


      if(inspectionListData.value.inspection_list!.length > 0){
        reversedList = new List.from(inspectionListData.value.inspection_list!.reversed);
      }

    });
  }

  getInsPectionListByInspectorId() async {

    Map data = {
      // "division_id": victimDivision.value.toString(),
      // "district_id": victimDistrict.value.toString(),
      // "thana_id": instituteUpazila.value.toString(),
      // "institute_type": instituteTypeId.value.toString(),
      //"inspector": inspectorID.value.toString(),
      "inspector": inspectorID.value.toString(),

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
        reversedList = new List.from(inspectionListData.value.inspection_list!);
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


  Future<void> share() async {
    await FlutterShare.share(
      title: 'TMED app institute inspection report pdf',
      text: 'Inspection report pdf',
      //text: 'Please click on attach link to show & download pdf',
      linkUrl: 'Please click on attach link to show & download pdf\n \n'+pdfUrl.value,
      //chooserTitle: 'Please click on attach link to show & download pdf'
    );
  }


  // Future<String> downloadFile(String url, String fileName, String dir) async {
  //   HttpClient httpClient = new HttpClient();
  //   File file;
  //   String filePath = '';
  //   String myUrl = '';
  //
  //   try {
  //     myUrl = url+'/'+fileName;
  //     var request = await httpClient.getUrl(Uri.parse(myUrl));
  //     var response = await request.close();
  //     if(response.statusCode == 200) {
  //       var bytes = await consolidateHttpClientResponseBytes(response);
  //       filePath = '$dir/$fileName';
  //       file = File(filePath);
  //       await file.writeAsBytes(bytes);
  //     }
  //     else
  //       filePath = 'Error code: '+response.statusCode.toString();
  //   }
  //   catch(ex){
  //     filePath = 'Can not fetch url';
  //   }
  //
  //   return filePath;
  // }

  chooseDate(String s) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
      //helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      // fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate

    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;

      if(s == 'from'){
        fromDate.value =  DateFormat("dd/MM/yyyy")
            .format(selectedDate.value).toString();
        getInsPectionListDateRange();
      }

      if(s == 'to'){
        toDate.value =  DateFormat("dd/MM/yyyy")
            .format(selectedDate.value).toString();

        getInsPectionListDateRange();
      }




      //toDateEditController.value.text = selectedDate.value.toString();
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 31))))) {
      return true;
    }
    return false;
  }



  postInsPection() async {
    InformationRepository().postInspection(inspectionData.value, true).then((resp) {
      //  allStudentData.value = resp;
      postResponse.value = resp;

      if(postResponse.value.status == "success"){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Inspection successfully inserted', title: 'Success'));
        Get.toNamed(Routes.PROVIDED_DATA_LIST);
      }

    });
  }

}