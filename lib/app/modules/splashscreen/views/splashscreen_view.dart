import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();
    return Stack(
      children: [
        // Container(
        //   height: _size.height,
        //   width: _size.width,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(image: AssetImage("assets/images/background.jpeg"), fit: BoxFit.cover),
        //   ),
        // ),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          // bottomNavigationBar: ConnectivityWidget(),
          body: Container(
            height: _size.height,
            width: _size.width,
            child: Stack(
              children: [
                Center(
                  child: Container(
                      height: 300,
                      child: Column(
                        children: [
                          Image(
                            height: 200,
                            width: 200,
                            image: AssetImage(
                              'assets/images/madsaraboardlogo.png',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xffec008c),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                // Positioned(
                //   bottom: 40,
                //   right: 0,
                //   left: 0,
                //   child: Image(
                //     height: 60,
                //     width: 60,
                //     image: AssetImage(
                //       'assets/images/madsaraboardlogo.png',
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: Ui.customLoader(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
