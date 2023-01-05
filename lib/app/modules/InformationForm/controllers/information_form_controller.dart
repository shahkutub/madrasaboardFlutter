import 'dart:async';
import 'dart:io';

import 'package:brac_arna/app/database_helper/offline_database_helper.dart';
import 'package:brac_arna/app/models/AllStudentRessponse.dart';
import 'package:brac_arna/app/models/Inspection_model.dart';
import 'package:brac_arna/app/models/InstituteTypeModel.dart';
import 'package:brac_arna/app/models/InstitutionDataModel.dart';
import 'package:brac_arna/app/models/PostResponse.dart';
import 'package:brac_arna/app/models/all_division_dis_thanan_model.dart';
import 'package:brac_arna/app/models/placeDataModel.dart';
import 'package:brac_arna/app/models/place_model.dart';
import 'package:brac_arna/app/modules/home/controllers/home_controller.dart';
import 'package:brac_arna/app/repositories/information_repository.dart';
import 'package:brac_arna/common/app_constant.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:date_format/date_format.dart';

import '../../../models/District.dart';
import '../../../models/InspectorListResponse.dart';
import '../../../models/Thana.dart';
import '../../../routes/app_pages.dart';

class InformationFormController extends GetxController {
  //TODO: Implement InformationFormController
  var selectedIndexes = [];

  List<String> itemsKarikulam = <String>[
    "খেলাধুলা ",
    "চিত্রাঙ্কন ",
    "বিতর্ক ",
    "থিয়েটার "
  ];

  final count = 0.obs;

  final places = PlaceDataModel().obs;
  final allDivDisTana = all_division_dis_thanan_model().obs;
  final allInstype = InstituteTypeModel().obs;
  final instituteData = InstitutionDataModel().obs;
  final postResponse = PostResponse().obs;

  final allStudentData = AllStudentRessponse().obs;

  final torturerplaces = PlaceDataModel().obs;
  final placeLoaded = false.obs;

  final dbHelper = DatabaseHelper.instance;
  final inspectorIdList = [].obs;
  final inspectorIdListJson = ''.obs;
  late var victimname = '';
  late var victimage = '';
  late var victimPhone = '';
  final victimDivision = ''.obs;
  final victimDivisionName = ''.obs;
  final victimDistrict = ''.obs;
  final instituteUpazila = ''.obs;
  final victimUnion = ''.obs;
  final eiinNumber = ''.obs;
  final instituteName = ''.obs;
  final inspectorName = ''.obs;
  final inspectorPost = ''.obs;
  final inspectorMobile = ''.obs;
  final inspectorEmil = ''.obs;
  final inspectionDate = ''.obs;
  final totalStudent = 0.obs;
  final totalBoyStudent = 0.obs;
  final totalFemaleStudent = 0.obs;
  final instituteTypeId = ''.obs;
  late var cleanActivity = '';
  late var instiruteHeadName = '';
  late var instiruteHeadMobile = '';

  final IsInternet = 0.obs;
  final IsOnlineClass = 0.obs;
  final IsGurdianMeeting = 0.obs;
  final IsTecherTraining = 0.obs;
  final IsCleanActivity = 0.obs;
  final IsElectricity = 0.obs;
  final IsMentalHealthActivity = ''.obs;
  final IsPrimaryHealthActivity = 0.obs;
  final IsPichiyePoraJorePora = ''.obs;
  final StatePlaintiffCaseDescription = ''.obs;
  final informationSource = ''.obs;

  final PersecutionDateAndTime = 'dd-mm-yyyy'.obs;

  final TorturerRelationWithVictimId = ''.obs;
  final OccurancePlaceId = ''.obs;
  final HasAnyDisabilities = ''.obs;
  final DisabilityId = ''.obs;
  final OtherDisabilityName = ''.obs;

  ///emergency
  final takenEmergencyHelp = ''.obs;
  final ImmediateFacilitationList = [].obs;


  final IntermediateFacilitationList = [].obs;
  //final districtList = <District>[].obs;
  List<District> districtList = <District>[].obs;
  List<Thana> thanaList = <Thana>[].obs;
  //List<District>? district_list;
  ///victim details

  final victimFatherName = ''.obs;
  final victimMotherNAme = ''.obs;
  final victimHusbandName = ''.obs;
  final victimNID = ''.obs;
  final victimBDCID = ''.obs;
  final victimMaritalStatus = ''.obs;
  final victimNoOfChild = ''.obs;
  final HaveTreatmentCertificate = ''.obs;

  ///tortureer details

  late var torturerName = '';
  final torturerAge = ''.obs;
  final torturerGender = ''.obs;
  final torturerOccup = ''.obs;
  final torturerMaritalStatus = ''.obs;
  late var numberOfTorturer = '';
  final torturerPresentAddress = ''.obs;
  final torturerLocationDetails = ''.obs;
  final torturerDivision = ''.obs;
  final torturerDistrict = ''.obs;
  final torturerUpazila = ''.obs;
  final torturerUnion = ''.obs;
  final torturerAddress = ''.obs;

  ///long term help

  final LongTermFacilitationList = [].obs;

  final documentType = ''.obs;
  final documents = [].obs;

  final type_of_co_karikulam = ''.obs;
  final cause_of_violence = ''.obs;
  final type_of_violence = ''.obs;
  final PersecutionReasonList = [].obs;


  var victimD = Set<String>();

  var victimU = Set<String>();

  var union = Set<String>();

  var torturerDist = Set<String>();

  var torturerUpa = Set<String>();

  var torturerUni = Set<String>();

  late GlobalKey<FormState> infoFormKey;

  var yesNo = ['হ্যাঁ না'];

  var types_of_co_karikulam = [

    {'id': '864345', 'title': 'খেলাধুলা'},
    {'id': '864344', 'title': 'চিত্রাঙ্কন'},
    {'id': '864343', 'title': 'বিতর্ক'},
    {'id': '866120', 'title': 'থিয়েটার'},

  ];





  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  late Box box;

  var  bmStudentCount = "0".obs;
  var  multimediaRoomCount = "0".obs ;
  var  skRaselLabCount = "0".obs ;
  var  covidVacCount = "0".obs ;
  var  dakhilexmineeCount = "0";
  var  alimexmineeCount = "0";
  var  fazilexmineeCount = "0";
  var  vocexmineeCount = "0";
  var  bmExmineeCount = "0";

  var  dakhilPassCount = "0";
  var  alimPassCount = "0";
  var  fazilPassCount = "0";
  var  vocPassCount = "0";
  var  bmPassCount = "0";
  var  teacherCount = "0";
  var  techerIctTraining = "0";
  var  mentalHealthActivity = "0";
  var  femaleteacherCount = "0";

  var myController;

  final Rx<Inspection_model> inspectionData = Inspection_model().obs;

  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  var currentLatitude = 0.0.obs;
  var currentLongitude = 0.0.obs;
  var totalDistance = 0.0.obs;


  var address = 'Getting Address..'.obs;
  late StreamSubscription<Position> streamSubscription;
  final insPectorListRespponse = InspectorListResponse().obs;

  var inspectionDateEditContr = TextEditingController().obs;
  var inspectorNameEditContr = TextEditingController().obs;
  List<String> draftInspectorName = <String>[].obs;

  var selectedDivname = "".obs;
  var selectedDistrictName = "".obs;
  var selectedThanaName = "".obs;
  @override
  Future<void> onInit() async {
    infoFormKey = GlobalKey<FormState>();
    box = Hive.box('formBox');
    try{
      print('date: '+AppConstant.inspectionData!.updated_at.toString());
      inspectionDateEditContr.value.text = AppConstant.inspectionData!.updated_at.toString();
      draftInspectorName.add("Admin");
      print('inspector_id: '+AppConstant.inspectionData!.inspector_id.toString());
      
      selectedDivname.value = AppConstant.inspectionData!.division_name.toString();
      selectedDistrictName.value = AppConstant.inspectionData!.district_name.toString();
      selectedThanaName.value = AppConstant.inspectionData!.thana_name.toString();

    }catch(e){}

    //getLocationData();
    //getAllStudent();
     getAldivDis();
     getAllInstituteType();
    getAllInspector();

    //getLocation();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getAllInspector() async {
    InformationRepository().getInsPectorList().then((resp) {
      insPectorListRespponse.value = resp;
      insPectorListRespponse.value.inspectors?.forEach((element) {

        try{
          if(element.id == AppConstant.inspectionData?.inspector_id){
            print('inspectorname: '+element.name!);
            draftInspectorName.add(element.name!);
            //inspectorNameEditContr.value.text = draftInspectorName;
          }
        }catch(e){

        }

      });

      // placeLoaded.value = true;
    });
  }

  getLocationData() async {
    // bmStudentCount = "70";
    // multimediaRoomCount = "1";
    InformationRepository().readLocationJsonData().then((resp) {
      places.value = resp;
      torturerplaces.value = resp;
      placeLoaded.value = true;
    });
  }

  Future selectDate() async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) selectedDate = picked;
    PersecutionDateAndTime.value = DateFormat('dd-MM-yyyy').format(selectedDate);
    if (PersecutionDateAndTime.value.isNotEmpty) {
      selectTime();
    }
   // PersecutionDateAndTime.update((val) {});
    print(DateFormat('dd-MM-yyyy').format(selectedDate));
  }

  Future selectTime() async {
    TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime,
    );
    if (picked != null) selectedTime = picked;
    var _hour = selectedTime.hour.toString();
    var _minute = selectedTime.minute.toString();
    var _time = _hour + ' : ' + _minute;
    PersecutionDateAndTime.value = PersecutionDateAndTime.value.toString() + ' ' + _time;

    // PersecutionDateAndTime.value = formatDate(DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute), [hh, ':', nn, " ", am]).toString();
    PersecutionDateAndTime.update((val) {});
  }

  addData() async {
    box.add({
      "id": Uuid().v1(),
      "IsInternet": IsInternet == 'Yes' ? 'true' : 'false',
      "IsGurdianMeeting": IsInternet == 'Yes' ? 'true' : 'false',
      "IsPichiyePoraJorePora": IsPichiyePoraJorePora == 'Yes' ? 'true' : 'false',
      "IsElectricity": IsElectricity == 'Yes' ? 'true' : 'false',
      "IsMentalHealthActivity": IsMentalHealthActivity == 'Yes' ? 'true' : 'false',
      "IsTecherTraining": IsTecherTraining == 'Yes' ? 'true' : 'false',
      "IsCleanActivity": IsCleanActivity == 'Yes' ? 'true' : 'false',
      "IsPrimaryHealthActivity": IsPrimaryHealthActivity == 'Yes' ? 'true' : 'false',
      // "StatePlaintiffCaseDescription": StatePlaintiffCaseDescription,
      "VictimName": victimname,
      "AgeInYear": victimage,
      "MobileNo": victimPhone,
      // "DistrictId": victimDistrict.value,
      // "UpazillaId": victimUpazila.value,
      // "UnionId": victimUnion.value,
      "PersecutionDateAndTime": PersecutionDateAndTime.value,
     // "VictimAddress": victimAddress,
      "PersecutionReasonList": PersecutionReasonList,
      // "InformationSource": informationSource.value,
      // "NeedImmediateFacilitation": true,
      // "NeedIntermediateFacilitation": true,
      // "NeedLongTermFacilitation": true,
      // "OccurancePlaceId": OccurancePlaceId.value,
      // "OccurancePlaceSpecification": 'OccurancePlaceSpecification',
      // "HasAnyDisabilities": true,
      // "DisabilityId": DisabilityId,
      // "OtherDisabilityName": "string",
      // "MothersName": victimMotherNAme.value,
      // "FathersName": victimFatherName.value,
      // "HusbandName": victimHusbandName.value,
      // "NidNo": victimNID.value,
      // "BirthCertificateNo": victimBDCID.value,
      // "HaveTreatmentCertificate": true,
      // "MaritalStatusId": victimMaritalStatus.value,
      // "NumberOfChild": victimNoOfChild.value,
      "TorturerName": torturerName,
      // "TorturerGenderId": torturerGender.value,
      // "TorturerOtherGenderName": "string",
      //  "TorturerOccupationId": torturerOccup,
      //"TorturerOtherOccupationName": "string",
      // "TorturerMaritalStatusId": torturerMaritalStatus,
      "NumberOfTorturer": numberOfTorturer,
      // "TorturerRelationWithVictimId": TorturerRelationWithVictimId,
      // "TorturerOtherRelationName": "string",
      // "TorturerCurrentLocationId": 0,
      // "TorturerOtherCurrentLocationName": "string",
      // "TorturerDistrictId": torturerDistrict.value,
      // "TorturerUpazillaId": torturerUpazila,
      // "TorturerUnionId": torturerUnion,
      // "TorturerAddress": torturerAddress,
      // "ImmediateFacilitationList": ImmediateFacilitationList,
      // "IntermediateFacilitationList": IntermediateFacilitationList,
      // "LongTermFacilitationList": LongTermFacilitationList,
      // "RelatedDocumentList": documents
    });

    Get.showSnackbar(Ui.SuccessSnackBar(message: 'Information added successfully'.tr, title: 'Success'.tr));
    Get.find<HomeController>().box = Hive.box('formBox');
    Get.find<HomeController>().addDataInList();
    print(box.length);
  }

  void getImage() async {
    selectedImagePath = ''.obs;
    selectedImageSize = ''.obs;

    // Crop code
    cropImagePath = ''.obs;
    cropImageSize = ''.obs;

    // Compress code
    compressImagePath = ''.obs;
    compressImageSize = ''.obs;

    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + " Mb";

      // Crop
      final cropImageFile = await ImageCropper().cropImage(sourcePath: selectedImagePath.value, maxWidth: 512, maxHeight: 512, compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value = ((File(cropImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + " Mb";

      // Compress
      print('compress path: ${cropImagePath.value}');
      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + '/' + cropImagePath.value.split('/').last;
      var compressedFile = await FlutterImageCompress.compressAndGetFile(cropImagePath.value, targetPath, quality: 90);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value = ((File(compressImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + " Mb";

      documents.add({'type': documentType.value, 'image': compressedFile});

      print(documents);

      // uploadImage(compressedFile);
    } else {
      Get.snackbar('Error', 'No image selected', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  getAldivDis() async {
    InformationRepository().getDivDisThana().then((resp) {
      allDivDisTana.value = resp;


      if(allDivDisTana.value == null){
        Get.toNamed(Routes.LOGIN);
      }


    });
  }
  getAllInstituteType() async {
    InformationRepository().getInstituteType().then((resp) {
      allInstype.value = resp;
      placeLoaded.value = true;
    });
  }

  getInstitute() async {
    InformationRepository().getInstitute(victimDivision.value, victimDistrict.value, instituteUpazila.value, instituteTypeId.value).then((resp) {
      instituteData.value = resp;
    });
  }

  postInsPection(String draft) async {
    InformationRepository().postInspection(inspectionData.value, true).then((resp) {
    //  allStudentData.value = resp;
      postResponse.value = resp;

      if(postResponse.value.status == "success"){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Inspection successfully inserted', title: 'Success'));
        Get.toNamed(Routes.PROVIDED_DATA_LIST);
      }

    });
  }


  getAllStudent() async {
    InformationRepository().getAllStudent().then((resp) {
      allStudentData.value = resp;

    });
  }



  // Future<List<District>?> listdistrict(int id) async {
  //   List<District>? di_list;
  //   for (var item in allDivDisTana!.value.district_list!) {
  //     if (item.division_id == id) {
  //       di_list!.add(item);
  //     }
  //   }
  //   return di_list;
  // }

  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          latitude.value = 'Latitude : ${position.latitude}';
          longitude.value = 'Longitude : ${position.longitude}';

          currentLatitude.value = position.latitude;
          currentLongitude.value = position.longitude;

          print('latitude: "latitude : "+${latitude}');

          getAddressFromLatLang(position);
        });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = 'আপনার অবস্থানঃ ${place.street},${place.locality},${place.country}';
  }

}
