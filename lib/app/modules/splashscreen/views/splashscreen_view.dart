import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();
    return Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          // bottomNavigationBar: ConnectivityWidget(),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image(
                  height: 200,
                  width: 200,
                  image: AssetImage(
                    'assets/images/govlogo.png',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'কারিগরি ও মাদ্রাসা শিক্ষা বিভাগ',
                    style: TextStyle(
                      fontSize: 24,
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

              ],
            ),

    );
  }
}
