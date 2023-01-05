import 'dart:async';

import 'package:brac_arna/app/models/user_model.dart';
import 'package:brac_arna/app/repositories/auth_repository.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_easy_permissions/super_easy_permissions.dart';
import 'package:uuid/uuid.dart';

import '../../../services/auth_service.dart';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
class after_login_controller extends GetxController {
  //TODO: Implement LoginController

  final Rx<UserModel> userData = UserModel().obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  final loading = false.obs;
  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  var address = 'Getting Address..'.obs;
  late StreamSubscription<Position> streamSubscription;
  late GlobalKey<FormState> loginFormKey;

  var isLocationEnable = false.obs;
  var isLocationPermission = false.obs;
  var filePermission = 'Not Enabled'.obs;
  @override
  Future<void> onInit() async {
    //getLocationPermission();

    // requesting permission
    // bool result = await SuperEasyPermissions.askPermission(
    //     Permissions.storage);
    //
    // SuperEasyPermissions.isGranted(Permissions.storage).then((result) {
    //   if (result) {
    //     filePermission.value = 'Granted !';
    //   }
    // });
    // final pdf = pw.Document();
    //
    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) => pw.Center(
    //       child: pw.Text('Hello World!'),
    //     ),
    //   ),
    // );
    //
    // final file = File('example.pdf');
    // await file.writeAsBytes(await pdf.save());
    // openFile(file);
    //AuthRepository().allProd();
    requestPermission();
    super.onInit();
  }

  void requestPermission() async{
    var status = await Permission.storage.status;

    if(!status.isGranted){
      await Permission.storage.request();
    }

    var status1 = await Permission.manageExternalStorage.status;

    if(!status1.isGranted){
      await Permission.manageExternalStorage.request();
    }
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void login(BuildContext context) async {
    // userData.value.fullName = userNameController.value.text;
    // userData.value.password = passwordController.value.text;
    Get.focusScope!.unfocus();

    Ui.customLoaderDialogWithMessage();
    AuthRepository().userLogin(userData.value,context).then((response) {
      print(response);

      if(response != null){
        //String? loginData = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
        Get.offAllNamed(Routes.AFTER_LOGIN);
        //Get.offAllNamed(Routes.HOME);
        // Get.find<RootController>().changePageOutRoot(0);
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successfully logged in'.tr, title: 'Success'.tr));
      }
      // if (response == 'Unauthorised') {
      //   Get.back();
      //   Get.showSnackbar(Ui.ErrorSnackBar(message: "Credentials doesn't match".tr, title: "Error".tr));
      // } else {
      //   Get.offAllNamed(Routes.INFORMATION_FORM);
      //   //Get.offAllNamed(Routes.HOME);
      //   // Get.find<RootController>().changePageOutRoot(0);
      //   Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successfully logged in'.tr, title: 'Success'.tr));
      // }
    });
  }

  getLocationPermission() async {

    LocationPermission permission;
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
    }else{
      isLocationPermission.value = true;
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


  }

  enableLocation() async {
    bool serviceEnabled;

    //LocationPermission permission;
    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    isLocationEnable.value = serviceEnabled;
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

  }
}