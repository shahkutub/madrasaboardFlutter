import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../models/District.dart';
import '../../../models/InstituteTypeModel.dart';
import '../../../models/InstitutionDataModel.dart';
import '../../../models/Thana.dart';
import '../../../models/all_division_dis_thanan_model.dart';
import '../../../repositories/information_repository.dart';
import '../../../routes/app_pages.dart';
class GeoLocationController extends GetxController {
  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  var currentLatitude = 0.0.obs;
  var currentLongitude = 0.0.obs;
  var totalDistance = 0.0.obs;


  var address = 'Getting Address..'.obs;
  late StreamSubscription<Position> streamSubscription;

  final placeLoaded = true.obs;
  var  inspectListPos = 0.obs;
  var  distanceBtwTwoInsti = 0.obs;

  final allDivDisTana = all_division_dis_thanan_model().obs;
  final allInstype = InstituteTypeModel().obs;
  final instituteData = InstitutionDataModel().obs;

  final pdfUrl = ''.obs;
  final victimDivision = ''.obs;
  final victimDivisionName = ''.obs;
  final victimDistrict = ''.obs;
  final instituteUpazila = ''.obs;
  final victimUnion = ''.obs;
  final eiinNumber = ''.obs;
  final instituteID = ''.obs;
  final instituteTypeId = ''.obs;
  final paromvikInstitute = ''.obs;
  final gonttoboInstitute = ''.obs;

  List<District> districtList = <District>[].obs;
  List<Thana> thanaList = <Thana>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
    getAldivDis();
    getAllInstituteType();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

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
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = 'আপনার অবস্থানঃ ${place.street},${place.locality},${place.country}';
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
      placeLoaded.value = false;
    });
  }

  getInstitute() async {
    InformationRepository().getInstitute(victimDivision.value, victimDistrict.value, instituteUpazila.value, instituteTypeId.value).then((resp) {
      instituteData.value = resp;
      placeLoaded.value = false;
    });
  }

   calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    totalDistance.value =  double.parse((12742 * asin(sqrt(a))).toStringAsFixed(2));
  }

}





























//Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //Position position = await Geolocator.getLastKnownPosition()