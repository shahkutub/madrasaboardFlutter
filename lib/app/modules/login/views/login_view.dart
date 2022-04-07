import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff683091),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        height: 400,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //   image: AssetImage(
                        //     'assets/images/background1.png',
                        //   ),
                        //   fit: BoxFit.fill,
                        // )),
                        child: Image(
                          image: AssetImage(
                            'assets/images/background1.png',
                          ),
                          fit: BoxFit.fill,
                          //color: Color(0xffec008c),
                          color: Colors.white,

                        )

                        // Stack(
                        //   children: <Widget>[
                        //     Positioned(
                        //       left: 30,
                        //       width: 80,
                        //       height: 200,
                        //       child: Container(
                        //         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-1.png'))),
                        //       ),
                        //     ),
                        //     Positioned(
                        //       left: 140,
                        //       width: 80,
                        //       height: 150,
                        //       child: Container(
                        //         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-2.png'))),
                        //       ),
                        //     ),
                        //     Positioned(
                        //       right: 40,
                        //       top: 40,
                        //       width: 80,
                        //       height: 150,
                        //       child: Container(
                        //         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
                        //       ),
                        //     ),
                        //     Positioned(
                        //       child: Container(
                        //         margin: EdgeInsets.only(top: 50),
                        //         child: Center(
                        //           child: Text(
                        //             "Login",
                        //             style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        ),
                    Positioned(
                      bottom: 100,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Column(
                            children: [
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
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 180,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 130,
                        width: 130,
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
                    // SizedBox(
                    //   height: 10,
                    // ),

                  ],
                ),
                Form(
                  key: controller.loginFormKey,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          // decoration: BoxDecoration(
                          //     color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10))]),
                          //
                          decoration: Ui.getBoxDecoration(color: Colors.white, radius: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
                                child: TextFormField(
                                 // controller: controller.userNameController.value,
                                  initialValue: "",
                                  onChanged: (input) {
                                    controller.userData.value.userName = input;
                                  },
                                  validator: (input) {
                                    return input!.isEmpty ? 'Please provide your username.' : null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "User Name".tr,
                                    hintStyle: TextStyle(color: Colors.grey[500]),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                 // controller: controller.passwordController.value,
                                  initialValue: "",
                                  onChanged: (input) {
                                    controller.userData.value.password = input;
                                  },
                                  validator: (input) {
                                    return input!.isEmpty ? 'Please provide your password.' : null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password".tr,
                                    hintStyle: TextStyle(color: Colors.grey[500]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.offAllNamed(Routes.INFORMATION_FORM);
                            //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
                            if (controller.loginFormKey.currentState!.validate()) {
                               controller.login();
                            }
                          },
                          child: Container(
                            height: 50,
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
                                "Login".tr,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
