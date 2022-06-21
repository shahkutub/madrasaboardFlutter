import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:brac_arna/app/FileProcess.dart';
import 'package:brac_arna/app/api_providers/api_manager.dart';
import 'package:brac_arna/app/api_providers/api_url.dart';
import 'package:brac_arna/app/models/InspectionListREsponse.dart';
import 'package:brac_arna/app/models/InstituteSumaryResponse.dart';
import 'package:brac_arna/app/models/InstitutionListResponse.dart';
import 'package:brac_arna/app/models/PoridorshonDataModel.dart';
import 'package:brac_arna/app/models/SummaryPdf.dart';
import 'package:brac_arna/app/models/user_model.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_easy_permissions/super_easy_permissions.dart';
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
  final placeLoaded = false.obs;
  var  inspectListPos = 0.obs;

  final allDivDisTana = all_division_dis_thanan_model().obs;
  final allInstype = InstituteTypeModel().obs;
  final instituteData = InstitutionDataModel().obs;

  final pdfUrl = ''.obs;
  //var url_last = ''.obs;
  final victimDivision = ''.obs;
  final victimDivisionName = ''.obs;
  final victimDistrict = ''.obs;
  final instituteUpazila = ''.obs;
  final victimUnion = ''.obs;
  final eiinNumber = ''.obs;
  final instituteID = ''.obs;
  final instituteTypeId = ''.obs;

  final hintextZela = 'জেলা নির্বাচন করুন'.obs;
  final hintextThana = 'উপজেলা নির্বাচন করুন'.obs;



  //List<District> districtList = <District>[].obs;
  List<District> districtList = <District>[].obs;
  List<Thana> thanaList = <Thana>[].obs;
  var instituteSummary = InstituteSumaryResponse().obs;
  var instituteListSummaryBased = InstitutionListResponse().obs;
  var instituteSummaryPdf = SummaryPdf().obs;
  var searchPdfPath = ''.obs;

  var districtName = ''.obs;
  var instituteListTitle = ''.obs;

  var upzilaName = ''.obs;
  @override
  Future<void> onInit() async {
    box = Hive.box('formBox');
    //addDataInList();

    // requesting permission
    bool result = await SuperEasyPermissions.askPermission(
        Permissions.storage);

    SuperEasyPermissions.isGranted(Permissions.storage).then((result) {
      if (result) {
       // filePermission.value = 'Granted !';
      }
    });

     getAldivDis();
     getAllInstituteType();
     //getInstitute();
    //instituteSumaryPdf();
    instituteSumary();

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

  Future instituteSumary() async {
    InformationRepository().instituteSumary(victimDivision.value,victimDistrict.value,
        instituteUpazila.value,instituteTypeId.value,instituteID.value).then((resp) {
      //  allStudentData.value = resp;
      instituteSummary.value = resp;

      // print('nointernet'+instituteSummary.value.api_info!.no_internet.toString());
      // print('noelectricity'+instituteSummary.value.api_info!.no_electricity.toString());
      placeLoaded.value = true;

      instituteSumaryPdf();
    });
  }

  Future instituteListSumaryBased(String url_last) async {
    InformationRepository().instituteListSumaryBased(url_last,victimDivision.value,victimDistrict.value,
        instituteUpazila.value,instituteTypeId.value,instituteID.value).then((resp) {
      //  allStudentData.value = resp;
      instituteListSummaryBased.value = resp;
      print('nointernet'+instituteListSummaryBased.value.api_info![0].name.toString());
      placeLoaded.value = true;
      // print('nointernet'+instituteSummary.value.api_info!.no_internet.toString());
      // print('noelectricity'+instituteSummary.value.api_info!.no_electricity.toString());
      //placeLoaded.value = true;

      //instituteSumaryPdf();
    });
  }

  Future instituteSumaryPdf() async {

    InformationRepository().instituteSumaryPdf(victimDivision.value,victimDistrict.value,
        instituteUpazila.value,instituteTypeId.value,instituteID.value).then((resp) async {
      instituteSummaryPdf.value = resp;
     print(''+instituteSummaryPdf.value.api_info!.toString());
      placeLoaded.value = true;

      //FileProcess.createFile(instituteSummaryPdf.value.api_info!.toString());




      createFileFromString();

      // Directory tempDir = await getTemporaryDirectory();
      // String tempPath = tempDir.path;
      // File file = new File('summary.png');
      // await file.writeAsBytes(resp.bodyBytes);
      //displayImage(file);
    });
  }

  Future<File> writeFile(Uint8List data, String name) async {
    // storage permission ask
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   await Permission.storage.request();
    // }
    // the downloads folder path
    Directory? tempDir = await DownloadsPathProvider.downloadsDirectory;
    String tempPath = tempDir!.path;
    var filePath = tempPath + '/$name';

    searchPdfPath.value = filePath;
    print('path: '+searchPdfPath.value);
    //

    // the data
    var bytes = ByteData.view(data.buffer);
    final buffer = bytes.buffer;
    // save the data in the path
    return File(filePath).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }


  Future<String> createFileFromString() async {

    // Convert to UriData
    var  data = Uri.parse(instituteSummaryPdf.value.api_info!).data;

// You can check if data is normal base64 - should return true
    print(data!.isBase64);

// Will returns your image as Uint8List
    Uint8List myImage = data.contentAsBytes();

    writeFile(myImage, "institution_summary.pdf");
    final encodedStr = instituteSummaryPdf.value.api_info;
    //Uint8List bytes = base64.decode(encodedStr!);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(myImage);
    print(file.path);
    return file.path;
  }




}