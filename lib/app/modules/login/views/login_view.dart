import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {


  @override
  Widget build(BuildContext context) {

    final startAddressController = TextEditingController();
    final destinationAddressController = TextEditingController();

    final startAddressFocusNode = FocusNode();
    final desrinationAddressFocusNode = FocusNode();
    var width = MediaQuery.of(context).size.width;
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
                                  //controller: controller.userNameController.value,
                                  //initialValue: "admin@gmail.com",
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
                                    hintText: "User Name",
                                    hintStyle: TextStyle(color: Colors.grey[500]),
                                  ),
                                ),
                              ),
                              // _textField(
                              //     label: 'User Name',
                              //     hint: 'Input User Name',
                              //     // prefixIcon: null,
                              //     // suffixIcon: IconButton(
                              //     //   icon: Icon(Icons.my_location),
                              //     //   onPressed: () {
                              //     //     // startAddressController.text = _currentAddress;
                              //     //     // _startAddress = _currentAddress;
                              //     //   },
                              //     // ),
                              //     controller: startAddressController,
                              //     focusNode: startAddressFocusNode,
                              //     width: width,
                              //     locationCallback: (String value) {
                              //       // setState(() {
                              //       //   _startAddress = value;
                              //       // });
                              //     }),
                              Container(
                                padding: EdgeInsets.all(8.0),

                                child: Obx(() =>TextFormField(
                                 // controller: controller.passwordController.value,
                                  //initialValue: "123",
                                  initialValue: "",
                                  onChanged: (input) {
                                    controller.userData.value.password = input;
                                  },
                                  validator: (input) {
                                    return input!.isEmpty ? 'Please provide your password.' : null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  //obscureText: true,
                                  // decoration: InputDecoration(
                                  //   border: InputBorder.none,
                                  //   hintText: "Password",
                                  //   hintStyle: TextStyle(color: Colors.grey[500]),
                                  // ),

                                  obscureText: controller.passwordVisible.value,//This will obscure text dynamically
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                   // labelText: 'Password',
                                    hintText: 'Enter your password',
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        controller.passwordVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        if(controller.passwordVisible.value){
                                          controller.passwordVisible.value = false;
                                        }else{
                                          controller.passwordVisible.value = true;
                                        }

                                      },
                                    ),
                                  ),


                                )),
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

                            // print('user: '+controller.userNameController.value.text);
                            //
                            // controller.userData.value.userName = controller.userNameController.value.text;
                            // controller.userData.value.password = controller.passwordController.value.text;
                            if (controller.loginFormKey.currentState!.validate()) {
                               controller.login(context);
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


  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    Widget? prefixIcon,
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
