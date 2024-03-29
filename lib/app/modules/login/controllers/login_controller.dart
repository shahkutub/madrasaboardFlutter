import 'dart:async';

import 'package:brac_arna/app/models/user_model.dart';
import 'package:brac_arna/app/repositories/auth_repository.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/LoginResponse.dart';
import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final passwordVisible = true.obs;
  final Rx<UserModel> userData = UserModel().obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  final loading = false.obs;
  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  var address = 'Getting Address..'.obs;
  late StreamSubscription<Position> streamSubscription;
  late GlobalKey<FormState> loginFormKey;
  LoginResponse loginResponse = LoginResponse();

  @override
  void onInit() {
    loginFormKey = GlobalKey<FormState>();
    requestPermission();
    //getLocation();
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

  @override
  void onReady() {
    // TODO: implement onReady
   // enableLocation();
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

        loginResponse = response;
        if(loginResponse.api_info!.original!.user!=null){
          //String? loginData = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
          Get.offAllNamed(Routes.AFTER_LOGIN);
          //Get.offAllNamed(Routes.HOME);
          // Get.find<RootController>().changePageOutRoot(0);
          Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successfully logged in'.tr, title: 'Success'.tr));
        }else{
          Get.showSnackbar(Ui.SuccessSnackBar(message: 'User not found'.tr, title: 'Alert!'.tr));

        }


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

  getLocation() async {
    //bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    //serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   await Geolocator.openLocationSettings();
    //   return Future.error('Location services are disabled.');
    // }
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
    // streamSubscription =
    //     Geolocator.getPositionStream().listen((Position position) {
    //       latitude.value = 'Latitude : ${position.latitude}';
    //       longitude.value = 'Longitude : ${position.longitude}';
    //       //getAddressFromLatLang(position);
    //     });
  }

  enableLocation() async {
    //bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    //serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   await Geolocator.openLocationSettings();
    //   return Future.error('Location services are disabled.');
    // }
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
    // streamSubscription =
    //     Geolocator.getPositionStream().listen((Position position) {
    //       latitude.value = 'Latitude : ${position.latitude}';
    //       longitude.value = 'Longitude : ${position.longitude}';
    //       //getAddressFromLatLang(position);
    //     });
  }

  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue.shade300,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

}