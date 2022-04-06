import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../controllers/after_login_controller.dart';
import '../controllers/login_controller.dart';

class AfterLoginView extends GetView<after_login_controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(

          child: Column(
            children: <Widget>[

              SizedBox(
                height: 50,
              ),
              Positioned(
                bottom: 150,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/govlogo.png',
                      ),
                      fit: BoxFit.fill,
                      // color: Color(0xffec008c),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'কারিগরি ও মাদ্রাসা শিক্ষা বিভাগ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'শিক্ষা মন্ত্রণালয়',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment.center,//Center Column contents horizontally,

                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.GENERAL_SEARCH);
                            //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
                            // if (controller.loginFormKey.currentState!.validate()) {
                            //    controller.login();
                            // }
                          },
                          child: Container(
                            height: 80,
                            width: 150,
                            //padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  //Color(0xffec008c),
                                  Colors.green,
                                  //Colors.pinkAccent.shade100
                                  Colors.green
                                  // Color.fromRGBO(143, 148, 251, 1),
                                  // Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "অনুসন্ধান",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.INFORMATION_FORM);
                            //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
                            // if (controller.loginFormKey.currentState!.validate()) {
                            //   controller.login();
                            // }
                          },
                          child: Container(
                            height: 80,
                            width: 150,
                            //padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  //Color(0xffec008c),
                                  Colors.green,
                                  //Colors.pinkAccent.shade100
                                  Colors.green
                                  // Color.fromRGBO(143, 148, 251, 1),
                                  // Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "শিক্ষা প্রতিষ্ঠান \nপরিদর্শন",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.PROVIDED_DATA_LIST);
                              //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
                              // if (controller.loginFormKey.currentState!.validate()) {
                              //   controller.login();
                              // }
                            },
                            child: Container(
                              height: 80,
                              width: 150,
                              //padding:  EdgeInsets.all(20),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    //Color(0xffec008c),
                                    Colors.green,
                                    //Colors.pinkAccent.shade100
                                    Colors.green
                                    // Color.fromRGBO(143, 148, 251, 1),
                                    // Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "শিক্ষা প্রতিষ্ঠান \nপরিদর্শন তালিকা",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.find<AuthService>().removeCurrentUser();
                              Get.toNamed(Routes.LOGIN);
                             // Get.toNamed(Routes.GEO_LOCATION);
                              //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
                              // if (controller.loginFormKey.currentState!.validate()) {
                              //   controller.login();
                              // }
                            },
                            child: Container(
                              height: 80,
                              width: 150,
                              //padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    //Color(0xffec008c),
                                    Colors.green,
                                    //Colors.pinkAccent.shade100
                                    Colors.green
                                    // Color.fromRGBO(143, 148, 251, 1),
                                    // Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "লগ আউট",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                        children: [

                          GestureDetector(
                            onTap: () {
                              if(controller.isLocationEnable.value == false ){
                                controller.enableLocation();
                              }else if( controller.isLocationPermission.value == false){
                                controller.getLocationPermission();
                              }else{
                                Get.toNamed(Routes.GEO_LOCATION);
                              }

                            },
                            child: Container(
                              height: 80,
                              width: 150,
                              //padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    //Color(0xffec008c),
                                    Colors.green,
                                    //Colors.pinkAccent.shade100
                                    Colors.green
                                    // Color.fromRGBO(143, 148, 251, 1),
                                    // Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "দুরত্ব পরিমাপ",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

              ),

            ],
          ),
        ));
  }
}
