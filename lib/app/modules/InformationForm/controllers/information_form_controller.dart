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
  late var victimname = '';
  late var victimage = '';
  late var victimPhone = '';
  final victimDivision = ''.obs;
  final victimDivisionName = ''.obs;
  final victimDistrict = ''.obs;
  final instituteUpazila = ''.obs;
  final victimUnion = ''.obs;
  final eiinNumber = ''.obs;
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

  var types_of_violence = [
    {'id': '864958', 'title': 'অন্যান্য'},
    {'id': '864345', 'title': 'অপহরণ ও মুক্তিপণের জন্য অপহরণ'},
    {'id': '864344', 'title': 'অর্থনৈতিক নির্যাতন'},
    {'id': '864343', 'title': 'আত্মহত্যার প্ররোচনা'},
    {'id': '866120', 'title': 'এসিড নির্যাতন'},
    {'id': '864955', 'title': 'কণ্যা শিশুহত্যা'},
    {'id': '864954', 'title': 'খুন'},
    {'id': '864342', 'title': 'গণধর্ষণ'},
    {'id': '864340', 'title': 'দগ্ধ নির্যাতন'},
    {'id': '864953', 'title': 'ধর্ষণ'},
    {'id': '864952', 'title': 'ধর্ষণ ও খুন'},
    {'id': '866107', 'title': 'ধর্ষণের চেষ্টা'},
    {'id': '864346', 'title': 'ধর্ষণের চেষ্টা'},
    {'id': '864347', 'title': 'নারী পাচার'},
    {'id': '864348', 'title': 'বহুবিবাহ'},
    {'id': '864356', 'title': 'বাল্যবিবাহ'},
    {'id': '864339', 'title': 'মানসিক নির্যাতন'},
    {'id': '864341', 'title': 'যৌন হয়রানি'},
    {'id': '864338', 'title': 'শারীরিক নির্যাতন'},
    {'id': '864957', 'title': 'সাইবার বুলিং'},
    {'id': '866108', 'title': 'হত্যার চেষ্টা'},
  ];

  List<Map> availableHobbies = [
    {"name": "Foobball", "isChecked": false},
    {"name": "Baseball", "isChecked": false},
    {
      "name": "Video Games",
      "isChecked": false,
    },
    {"name": "Readding Books", "isChecked": false},
    {"name": "Surfling The Internet", "isChecked": false}
  ].obs;

  var causes_of_violence = [
    {'id': '864374', 'title': 'অন্যান্য'},
    {'id': '864372', 'title': 'অশ্লীল প্রস্তাব'},
    {'id': '864370', 'title': 'আপত্তিকর মনমানসিকতা'},
    {'id': '864373', 'title': 'কর্তৃত্বপূর্ণ অভিভাবকত্ব'},
    {'id': '864364', 'title': 'কুসংস্কার'},
    {'id': '864361', 'title': 'জমিজমা সংক্রান্ত বিবাদ'},
    {'id': '864358', 'title': 'জুয়া খেলা'},
    {'id': '864360', 'title': 'টাকা পয়সা নিয়ে দ্বন্দ্ব'},
    {'id': '864352', 'title': 'দারিদ্র'},
    {'id': '866125', 'title': 'ধর্মীয় অপব্যাখা'},
    {'id': '864368', 'title': 'প্রত্যাখ্যান (প্রেমের সম্পর্ক)'},
    {'id': '864366', 'title': 'প্রযুক্তির অপব্যবহার'},
    {'id': '864351', 'title': 'পারিবারিক কলহ'},
    {'id': '864367', 'title': 'ব্যক্তিগত প্রতিহিংসা'},
    {'id': '864353', 'title': 'বহুবিবাহ'},
    {'id': '864369', 'title': 'বিনোদনের অভাব'},
    {'id': '864354', 'title': 'বিবাহ বহির্ভুত সম্পর্ক'},
    {'id': '864371', 'title': 'বেকারত্ব'},
    {'id': '864362', 'title': 'ভরণপোষণের অভাব'},
    {'id': '864356', 'title': 'মাদকাসক্তি'},
    {'id': '864355', 'title': 'মেয়ে শিশুর জন্ম'},
    {'id': '864365', 'title': 'মোবাইল/ইন্টারনেট/টিভির নেতিবাচক ব্যবহার'},
    {'id': '864350', 'title': 'যৌতুক'},
    {'id': '864359', 'title': 'রাগ / ক্ষোভ'},
    {'id': '864357', 'title': 'সন্তান ধারণে অক্ষমতা'},
  ];

  var blood_group = [
    {"id": "863719", "name": "A-"},
    {"id": "863720", "name": "A+"},
    {"id": "863721", "name": "AB-"},
    {"id": "863722", "name": "AB+"},
    {"id": "863723", "name": "B-"},
    {"id": "863724", "name": "B+"},
    {"id": "863725", "name": "O-"},
    {"id": "863726", "name": "O+"}
  ];
  var disability = [
    {"id": "864983", "name": "অন্যান্য"},
    {"id": "864982", "name": "মানসিক"},
    {"id": "864981", "name": "শারীরিক"}
  ];

  var document_type = [
    {"id": "866105", "name": "জিডি কপি"},
    {"id": "866104", "name": "প্রেসক্রিপশন"}
  ];
  var gender = [
    {"id": "862677", "name": "অন্যান্য (নির্দিষ্ট করে লিখুন)"},
    {"id": "860516", "name": "পুরুষ"},
    {"id": "860517", "name": "মহিলা"}
  ];

  var emergency_help = [
    {"id": "864382", "name": "১০৯ এ ফোন করা"},
    {"id": "864384", "name": "16430"},
    {"id": "864383", "name": "999"},
    {"id": "864962", "name": "অন্যান্য"},
    {"id": "864385", "name": "পুলিশ"},
    {"id": "864961", "name": "হাসপাতাল"}
  ];

  var intermediate_support = [
    {"id": "866111", "name": "অন্যান্য"},
    {"id": "864378", "name": "আইনী সহায়তা"},
    {"id": "864376", "name": "চিকিৎসা সহায়তা"},
    {"id": "864377", "name": "মনোসামাজিক সহায়তা"},
    {"id": "864968", "name": "শেল্টার হোম"}
  ];

  var place_of_occurrence = [
    {"id": "864976", "name": "অন্যান্য"},
    {"id": "864980", "name": "আত্মীয়স্বজনের বাড়িতে"},
    {"id": "864971", "name": "কর্মস্থলে"},
    {"id": "864973", "name": "গণপরিবহনে"},
    {"id": "864972", "name": "জনপরিসরে"},
    {"id": "864979", "name": "নিজের বাড়িতে"},
    {"id": "864974", "name": "প্রবাসে অবস্থানকালীন সময়"},
    {"id": "864969", "name": "পারিবারিক পরিসরে"},
    {"id": "864978", "name": "বাবার বাড়িতে"},
    {"id": "864977", "name": "শ্বশুর বাড়িতে"},
    {"id": "864970", "name": "শিক্ষা প্রতিষ্ঠানে"},
    {"id": "864975", "name": "সাইবার জগতে\/অনলাইনে"}
  ];

  var long_term_support = [
    {"id": "864381", "name": "অন্যান্য"},
    {"id": "866110", "name": "আয় মূলক কার্যক্রম"},
    {"id": "864379", "name": "আর্থিক পুনর্বাসন"},
    {"id": "864380", "name": "দক্ষতা উন্নয়ন প্রশিক্ষণ"},
    {"id": "864965", "name": "সাংগঠনিক সংযুক্তিকরণ"}
  ];

  var marital_status = [
    {"id": "865042", "name": "অবিবাহিত"},
    {"id": "865046", "name": "তালাকপ্রাপ্ত"},
    {"id": "865044", "name": "বিচ্ছেদ"},
    {"id": "865045", "name": "বিধবা"},
    {"id": "865043", "name": "বিবাহিত"},
    {"id": "866119", "name": "স্বামী পরিত্যক্তা "}
  ];

  var relationship_with_abuser = [
    {"id": "865003", "name": "অন্যান্য"},
    {"id": "865009", "name": "অন্যান্য আত্মীয়"},
    {"id": "865015", "name": "অপরিচিত"},
    {"id": "865010", "name": "প্রতিবেশী"},
    {"id": "865011", "name": "পরিচিত"},
    {"id": "865012", "name": "বন্ধু"},
    {"id": "865004", "name": "বাবা"},
    {"id": "865005", "name": "ভাইবোন"},
    {"id": "865006", "name": "মা"},
    {"id": "865007", "name": "শ্বশুর শাশুড়ি"},
    {"id": "865008", "name": "শ্বশুরবাড়ির অন্য সদস্য"},
    {"id": "865014", "name": "শিক্ষক"},
    {"id": "866117", "name": "স্বামী "},
    {"id": "866118", "name": "স্বামী "},
    {"id": "865013", "name": "সহকর্মী"}
  ];

  var current_position_of_perpetrator = [
    {"id": "865050", "name": "অন্যান্য (নির্দিষ্ট করে লিখুন)"},
    {"id": "865049", "name": "জেলখানায়"},
    {"id": "865048", "name": "পলাতক"},
    {"id": "865047", "name": "বাসায়"}
  ];

  var occupation_of_torturer = [
    {"id": "865019", "name": "অন্যান্য"},
    {"id": "865041", "name": "ইলেক্ট্রিশিয়ান"},
    {"id": "865040", "name": "কাঠমিস্ত্রী"},
    {"id": "865026", "name": "কারখানা শ্রমিক"},
    {"id": "865021", "name": "কারিগর"},
    {"id": "865025", "name": "খনি শ্রমিক"},
    {"id": "865020", "name": "জেলে"},
    {"id": "865024", "name": "ড্রাইভার"},
    {"id": "865033", "name": "দর্জি"},
    {"id": "865030", "name": "দিনমজুর"},
    {"id": "865036", "name": "ধোপা"},
    {"id": "865028", "name": "পরিচ্ছন্নতা কর্মী"},
    {"id": "865023", "name": "পুলিশ"},
    {"id": "865022", "name": "ফেরিওয়ালা"},
    {"id": "865031", "name": "বন কর্মী"},
    {"id": "865038", "name": "বাজার বিক্রেতা"},
    {"id": "865027", "name": "বাবুর্চি"},
    {"id": "866112", "name": "বেসরকারি চাকরিজীবী"},
    {"id": "865037", "name": "ভ্রমণ নির্দেশনাকারী বা ট্যুর গাইড"},
    {"id": "865034", "name": "ভাসমান দোকানী"},
    {"id": "865032", "name": "মেথর"},
    {"id": "865029", "name": "শিক্ষক"},
    {"id": "865035", "name": "স্বাস্থ্যসেবা কর্মী"},
    {"id": "865039", "name": "সরকারি চাকরিজীবী"}
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


  @override
  Future<void> onInit() async {
    infoFormKey = GlobalKey<FormState>();
    box = Hive.box('formBox');
    documentType.value = document_type[0]['name']!;
    //getLocationData();
    //getAllStudent();
    getAldivDis();
    getAllInstituteType();

    getLocation();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
