import 'dart:async';
import 'dart:convert';
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



  ///long term help

  final LongTermFacilitationList = [].obs;

  final documentType = ''.obs;
  final documents = [].obs;

  final type_of_co_karikulam = ''.obs;
  final cause_of_violence = ''.obs;
  final type_of_violence = ''.obs;
  final PersecutionReasonList = [].obs;



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
  var recogniseDateEditContr = TextEditingController().obs;
  var mpoDateEditContr = TextEditingController().obs;
  var headTeacherEditContr = TextEditingController().obs;
  var headTeacherMobileEditContr = TextEditingController().obs;
  var teacherCountEditContr = TextEditingController().obs;
  var womanteacherCountEditContr = TextEditingController().obs;
  var studentCountEditContr = TextEditingController().obs;
  var girlstudentCountEditContr = TextEditingController().obs;
  var examineeCountEditContr = TextEditingController().obs;
  var passedCountEditContr = TextEditingController().obs;
  var multimediaRoomCountEditContr = TextEditingController().obs;
  var digitalLabCountEditContr = TextEditingController().obs;
  var weeklyActivityEditContr = TextEditingController().obs;
  var softskillEditContr = TextEditingController().obs;
  var cocaricolamActiEditContr = TextEditingController().obs;
  var classActivityEditContr = TextEditingController().obs;
  var classUpgradeEditContr = TextEditingController().obs;
  var overAllStatusEditContr = TextEditingController().obs;
  var commentEditContr = TextEditingController().obs;

  List<String> selectedInspectorNameList = <String>[].obs;
  List<String> selectedInspectorIdList = <String>[].obs;

  var selectedDivname = "".obs;
  var selectedDistrictName = "".obs;
  var selectedThanaName = "".obs;
  var selectedInstituteTypeName = "".obs;
  var selectedInstituteName = "".obs;
  var selectedElectricity = "".obs;
  var selectedInternet_facility = "".obs;
  var selectedIctTraining = "".obs;
  var selectedOtherTraining = "".obs;
  var selectedOnlineClass = "".obs;
  var selectedMentalHealth = "".obs;
  var selectedCleanActivity = "".obs;
  var selectedGuardian_gathering = "".obs;

  var selectedDate = DateTime.now().obs;
  @override
  Future<void> onInit() async {
    infoFormKey = GlobalKey<FormState>();
    box = Hive.box('formBox');
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    inspectionDateEditContr.value.text = formattedDate.toString();
    recogniseDateEditContr.value.text = formattedDate.toString();
    mpoDateEditContr.value.text = formattedDate.toString();
    try{
      print('date: '+AppConstant.inspectionData!.updated_at.toString());


      inspectionDateEditContr.value.text = AppConstant.inspectionData!.updated_at !=null ?AppConstant.inspectionData!.updated_at.toString():formattedDate;

      recogniseDateEditContr.value.text = AppConstant.inspectionData!.approval_date !=null ? AppConstant.inspectionData!.approval_date.toString():'';
      mpoDateEditContr.value.text = AppConstant.inspectionData!.mpo_date !=null ? AppConstant.inspectionData!.mpo_date.toString():'';
      inspectionData.value.mpo_date = AppConstant.inspectionData!.mpo_date !=null ? AppConstant.inspectionData!.mpo_date.toString():'';

      headTeacherEditContr.value.text = AppConstant.inspectionData!.headmaster_name !=null ? AppConstant.inspectionData!.headmaster_name.toString():'';
      inspectionData.value.headmaster_name = AppConstant.inspectionData!.headmaster_name !=null ? AppConstant.inspectionData!.headmaster_name.toString():'';

      headTeacherMobileEditContr.value.text = AppConstant.inspectionData!.headmaster_mobile_no !=null ? AppConstant.inspectionData!.headmaster_mobile_no.toString():'';
      inspectionData.value.headmaster_mobile_no = AppConstant.inspectionData!.headmaster_mobile_no !=null ? AppConstant.inspectionData!.headmaster_mobile_no.toString():'';

      teacherCountEditContr.value.text = AppConstant.inspectionData!.total_teachers
          !=null ? AppConstant.inspectionData!.total_teachers.toString():'';
      inspectionData.value.total_teachers = AppConstant.inspectionData!.total_teachers
          !=null ? AppConstant.inspectionData!.total_teachers.toString():'';

      womanteacherCountEditContr.value.text = AppConstant.inspectionData!.total_women_teachers !=null ? AppConstant.inspectionData!.total_women_teachers.toString():'';
      inspectionData.value.total_women_teachers = AppConstant.inspectionData!.total_women_teachers !=null ? AppConstant.inspectionData!.total_women_teachers.toString():'';

      studentCountEditContr.value.text = AppConstant.inspectionData!.total_students !=null ? AppConstant.inspectionData!.total_students.toString():'';
      inspectionData.value.total_students = AppConstant.inspectionData!.total_students !=null ? AppConstant.inspectionData!.total_students.toString():'';

      girlstudentCountEditContr.value.text = AppConstant.inspectionData!.total_girls_students !=null ? AppConstant.inspectionData!.total_girls_students.toString():'';
      inspectionData.value.total_girls_students = AppConstant.inspectionData!.total_girls_students !=null ? AppConstant.inspectionData!.total_girls_students.toString():'';

      examineeCountEditContr.value.text = AppConstant.inspectionData!.total_examinees !=null ? AppConstant.inspectionData!.total_examinees.toString():'';
      inspectionData.value.total_examine = AppConstant.inspectionData!.total_examinees !=null ? AppConstant.inspectionData!.total_examinees.toString():'';

      passedCountEditContr.value.text = AppConstant.inspectionData!.total_passed
          !=null ? AppConstant.inspectionData!.total_passed.toString():'';

      inspectionData.value.total_passed = AppConstant.inspectionData!.total_passed
          !=null ? AppConstant.inspectionData!.total_passed.toString():'';

      multimediaRoomCountEditContr.value.text = AppConstant.inspectionData!.total_multimedia_classroom
          !=null ? AppConstant.inspectionData!.total_multimedia_classroom.toString():'';

      inspectionData.value.total_multimedia_classroom =  AppConstant.inspectionData!.total_multimedia_classroom
          !=null ? AppConstant.inspectionData!.total_multimedia_classroom.toString():'';

      digitalLabCountEditContr.value.text = AppConstant.inspectionData!.total_digital_lab
          !=null ? AppConstant.inspectionData!.total_digital_lab.toString():'';

      inspectionData.value.total_digital_lab = AppConstant.inspectionData!.total_digital_lab
          !=null ? AppConstant.inspectionData!.total_digital_lab.toString():'';

      weeklyActivityEditContr.value.text = AppConstant.inspectionData!.week_studuents_activities
          !=null ? AppConstant.inspectionData!.week_studuents_activities.toString():'';
      inspectionData.value.week_studuents_activities = AppConstant.inspectionData!.week_studuents_activities
          !=null ? AppConstant.inspectionData!.week_studuents_activities.toString():'';


      softskillEditContr.value.text = AppConstant.inspectionData!.soft_skill_description
          !=null ? AppConstant.inspectionData!.soft_skill_description.toString():'';
      inspectionData.value.soft_skill = AppConstant.inspectionData!.soft_skill_description
          !=null ? AppConstant.inspectionData!.soft_skill_description.toString():'';

      cocaricolamActiEditContr.value.text = AppConstant.inspectionData!.cocurricular_activities
          !=null ? AppConstant.inspectionData!.cocurricular_activities.toString():'';
      inspectionData.value.cocurricular_activities = AppConstant.inspectionData!.cocurricular_activities
          !=null ? AppConstant.inspectionData!.cocurricular_activities.toString():'';

      classActivityEditContr.value.text = AppConstant.inspectionData!.class_inspection
          !=null ? AppConstant.inspectionData!.class_inspection.toString():'';
      inspectionData.value.class_inspection = AppConstant.inspectionData!.class_inspection
          !=null ? AppConstant.inspectionData!.class_inspection.toString():'';

      classUpgradeEditContr.value.text = AppConstant.inspectionData!.class_upgradation_suggestion
          !=null ? AppConstant.inspectionData!.class_upgradation_suggestion.toString():'';
      inspectionData.value.upgradationSuggession = AppConstant.inspectionData!.class_upgradation_suggestion
          !=null ? AppConstant.inspectionData!.class_upgradation_suggestion.toString():'';

      overAllStatusEditContr.value.text = AppConstant.inspectionData!.overall_status
          !=null ? AppConstant.inspectionData!.overall_status.toString():'';

      inspectionData.value.overall_status = AppConstant.inspectionData!.overall_status
          !=null ? AppConstant.inspectionData!.overall_status.toString():'';

      commentEditContr.value.text = AppConstant.inspectionData!.comments
          !=null ? AppConstant.inspectionData!.comments.toString():'';
      inspectionData.value.comments = AppConstant.inspectionData!.comments
          !=null ? AppConstant.inspectionData!.comments.toString():'';

          print('InspctorList: '+AppConstant.inspectionData!.inspection_inspector_list!.length.toString());



      //selectedInspectorIdList.add('1');
      AppConstant.inspectionData!.inspection_inspector_list!.forEach((element) {
        selectedInspectorIdList.add(element.inspector_id.toString());
        inspectorIdList.add(element.inspector_id);
      });
      // inspectorIdListJson.value = jsonEncode(inspectorIdList);
      // print('IdListjson: ${inspectorIdListJson.value.toString()}');

     // inspectionData.value.inspector_id = inspectorIdListJson.value.toString();
      inspectionData.value.inspector_id = "${inspectorIdList.join(',')}";


      selectedDivname.value = AppConstant.inspectionData!.division_name.toString();
      inspectionData.value.division_id = AppConstant.inspectionData!.division_id;

      selectedDistrictName.value = AppConstant.inspectionData!.district_name.toString();
      inspectionData.value.district_id = AppConstant.inspectionData!.district_id;

      selectedThanaName.value = AppConstant.inspectionData!.thana_name.toString();
      inspectionData.value.thana_id = AppConstant.inspectionData!.thana_id;

      selectedInstituteName.value = AppConstant.inspectionData!.institution_name.toString();
      inspectionData.value.institute_id = AppConstant.inspectionData!.institute_id;




      selectedElectricity.value = AppConstant.inspectionData!.electricity_facility == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.electricity_facility = AppConstant.inspectionData!.electricity_facility;

      selectedInternet_facility.value = AppConstant.inspectionData!.internet_facility == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.internet_facility = AppConstant.inspectionData!.internet_facility;

      selectedIctTraining.value = AppConstant.inspectionData!.ict_training == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.isIctTraining = int.parse(AppConstant.inspectionData!.ict_training.toString());

      selectedOtherTraining.value = AppConstant.inspectionData!.teacher_training == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.isOtherTraining = AppConstant.inspectionData!.teacher_training;

      selectedOnlineClass.value = AppConstant.inspectionData!.online_class == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.isOnlineClass = AppConstant.inspectionData!.online_class;

      selectedMentalHealth.value = AppConstant.inspectionData!.mental_health_activities == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.mentalHealthActivity = AppConstant.inspectionData!.mental_health_activities;

      selectedCleanActivity.value = AppConstant.inspectionData!.cleaning_steps == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.isCleanness = int.parse(AppConstant.inspectionData!.cleaning_steps.toString());

      selectedGuardian_gathering.value = AppConstant.inspectionData!.guardian_gathering == 1 ? 'হ্যাঁ':'না';
      inspectionData.value.guardian_gathering = AppConstant.inspectionData!.guardian_gathering.toString();

      //selectedInspectorNameList.add('admin');


    }catch(e){}

    //getLocationData();
    //getAllStudent();
    getAllInspector();
     getAldivDis();
     getAllInstituteType();


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

      try{
       // selectedInspectorNameList.add('admin');
        selectedInspectorIdList.forEach((element1) {
          print("element1:"+element1);
          insPectorListRespponse.value.inspectors?.forEach((element2) {

            if(element1 == element2.id.toString()){
              print("element2: "+element2.id.toString());
              selectedInspectorNameList.add(element2.name!.toString());
            }

          });
        });
      }catch(e){

      }




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
      if(AppConstant.inspectionData != null){
        allInstype.value.institute__type_list!.forEach((element) {
          if(element.id == AppConstant.inspectionData!.institute_type){
            selectedInstituteTypeName.value = element.name;
            inspectionData.value.institute_type = element.id;
          }
        });
      }


    });
  }

  getInstitute() async {
    InformationRepository().getInstitute(victimDivision.value, victimDistrict.value, instituteUpazila.value, instituteTypeId.value).then((resp) {
      instituteData.value = resp;
    });
  }

  postInsPection(String draft) async {

    inspectionData.value.inspectionDate = inspectionDateEditContr.value.text.toString();


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
