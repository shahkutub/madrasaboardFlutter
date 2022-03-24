import 'package:brac_arna/app/models/place_model.dart';
import 'package:brac_arna/app/modules/global_widgets/dropdown_widget.dart';
import 'package:brac_arna/app/modules/global_widgets/dropdown_widget_menu.dart';
import 'package:brac_arna/app/modules/global_widgets/multiple_selection_dropdown.dart';
import 'package:brac_arna/app/modules/global_widgets/text_field_widget.dart';
import 'package:brac_arna/app/modules/global_widgets/text_field_widget_small.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/information_form_controller.dart';

class InformationFormView extends GetView<InformationFormController> {

  @override
  Widget build(BuildContext context) {
    // Get.find<InformationFormController>();

    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: PreferredSize(
          preferredSize: Size(60, 60),
          child: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            centerTitle: true,
            title: Text('শিক্ষা প্রতিঠান পরিদর্শন'),

            actions: <Widget>[
              // RaisedButton(
              //   onPressed: () {
              //     Get.toNamed(Routes.PROVIDED_DATA_LIST);
              //   },
              //   color: Colors.amber,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Text("পূর্বের পরিদর্শন",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // TextButton(
              //     onPressed: () {
              //       Get.toNamed(Routes.PROVIDED_DATA_LIST);
              //     },
              //     child: Text("পূর্বের পরিদর্শন",
              //       style: TextStyle(color: Colors.purple),
              //     ),
              //
              // ),

              Center(
                child: Container(
                  height: 30,
                  child: RawMaterialButton(
                    onPressed: () {
                      Get.toNamed(Routes.PROVIDED_DATA_LIST);
                    },
                    elevation: 2.0,
                    fillColor: Colors.indigo,
                    child: Text("পূর্বের পরিদর্শন",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),


            ],
          ),
        ),
        body: Obx(() {
          if (controller.placeLoaded.isTrue) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: controller.infoFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        //width: Get.size.width,
                        //decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                        // decoration: new BoxDecoration(
                        //     gradient: new LinearGradient(
                        //       begin: Alignment.topCenter,
                        //       end: Alignment.bottomCenter,
                        //       colors: [
                        //         Color.fromARGB(255, 25,178,238),
                        //         Color.fromARGB(255, 21,236,229)
                        //       ],
                        //     )),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            DropDownWidget(
                              labelText: "বিভাগ",
                              hintText: "বিভাগ নির্বাচন করুন",
                              initialValue: '',

                              //data: controller.places.value.area!.map((item) => item.divisionName!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
                              data: controller.allDivDisTana!.value.division_list?.map((item) => item.name!).toList(),
                              iconData: Icons.phone_android,
                              onChanged: (input) {

                               // controller.victimDivisionName.value =input;
                                for (var item in controller.allDivDisTana.value.division_list!) {
                                  if (item.name == input) {
                                    controller.victimDivision.value = item.id.toString();
                                    //controller.districtList.add(item);

                                  }
                                }


                                //controller.getAldivDis();
                                print('divisionId: ${controller.victimDivision.value}');
                                //print('district: ${controller.districtList[0].name}');
                                controller.districtList.clear();
                                for (var itemd in controller.allDivDisTana.value.district_list!) {
                                  //print('divisionId: ${controller.victimDivision.value}');
                                  if (itemd.division_id.toString() == controller.victimDivision.value.toString().trim()) {
                                    print('divisionIddd: ${controller.victimDivision.value}');
                                    //controller.victimDivision.value = item.id.toString();
                                    controller.districtList.add(itemd);

                                  }
                                }
                                //print('district: ${controller.districtList[0].name}');
                              },
                              isFirst: true,
                              isLast: false,
                            ),
                            DropDownWidget(
                              labelText: "জেলা",
                              hintText: "জেলা নির্বাচন করুন",
                              initialValue: '',
                              //data: controller.allDivDisTana!.value.district_list!.map((item) => item.name!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
                              data: controller.districtList?.map((item) => item.name!).toList(),


                              // data: controller.allDivDisTana!.value.district_list!
                              //     .where((element) => element.division_id == controller.victimDivision.value)
                              //     .map((item) => item.name!)
                              //     .toList(),
                                  // .where((country) => controller.victimU.add(country.toString()))
                                  // .toList()

                              iconData: Icons.phone_android,
                              onChanged: (input) {
                                for (var item in controller.allDivDisTana.value.district_list!) {
                                  if (item.name == input) {
                                    controller.victimDistrict.value = item.id!.toString();
                                  }
                                }

                                controller.thanaList.clear();
                                for (var itemd in controller.allDivDisTana.value.thana_list!) {
                                  //print('divisionId: ${controller.victimDivision.value}');
                                  if (itemd.district_id.toString() == controller.victimDistrict.value.toString().trim()) {
                                    print('districtIddd: ${controller.victimDivision.value}');
                                    //controller.victimDivision.value = item.id.toString();
                                    controller.thanaList.add(itemd);

                                  }
                                }

                               // controller.getLocationData();
                                print('district: ${controller.victimDistrict.value}');
                              },
                              isFirst: true,
                              isLast: false,
                            ),
                            DropDownWidget(
                              labelText: "উপজেলা",
                              hintText: "উপজেলা নির্বাচন করুন",
                              initialValue: '',
                              iconData: Icons.phone_android,
                              data: controller.thanaList?.map((item) => item.name!).toList(),
                              onChanged: (input) {
                                for (var item in controller.thanaList) {
                                  if (item.name == input) {
                                    controller.instituteUpazila.value = item.id!.toString();
                                  }
                                }
                               // controller.getLocationData();
                                print('upazila: ${controller.instituteUpazila.value}');
                              },
                              isFirst: true,
                              isLast: false,
                            ),
                            DropDownWidget(
                              labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
                              hintText: "শিক্ষা প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
                              initialValue: '',
                              iconData: Icons.phone_android,
                              data: controller.allInstype.value.institute__type_list?.map((item) => item.name!).toList(),
                              onChanged: (input) {
                                for (var item in controller.allInstype.value.institute__type_list!) {
                                  if (item.name == input) {
                                    controller.instituteTypeId.value = item.id!.toString();
                                  }
                                }
                                //controller.getLocationData();
                                //print('union_ id: ${controller.victimUnion.value}');
                                controller.getInstitute();
                              },
                              isFirst: true,
                              isLast: false,
                            ),
                            DropDownWidget(
                              labelText: "শিক্ষা প্রতিষ্ঠানের নাম",
                              hintText: "শিক্ষা প্রতিষ্ঠানের নাম নির্বাচন করুন",
                              initialValue: '',
                              iconData: Icons.phone_android,
                              data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
                              onChanged: (input) {
                                // for (var item in controller.instituteData.value.institute_list!) {
                                //   if (item.name == input) {
                                //     controller.eiinNumber.value = item.eiin!;
                                //   }
                                // }


                                for (var item in controller.allStudentData.value.students!) {
                                  if (item.thana_id == controller.instituteUpazila.value && item.institute_type_id == controller.instituteTypeId) {
                                    controller.totalStudent.value = item.total! as int;
                                    controller.totalFemaleStudent.value = item.total_girls! as int;
                                  }
                                }

                                //controller.totalBoyStudent.value = controller.totalStudent.value - controller.totalFemaleStudent.value ;

                                // controller.getLocationData();
                                // print('union_ id: ${controller.victimUnion.value}');
                              },
                              isFirst: true,
                              isLast: false,
                            ),

                            // TextFieldWidgetSmall(
                            //   labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
                            //   hintText: "",
                            //   initialValue: 'ebtedayee',
                            //   onChanged: (input) {
                            //     controller.victimAddress = input;
                            //   },
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   //iconData: Icons.person,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),


                            // TextFieldWidgetSmall(
                            //   labelText: "অনুমোদন এর তারিখ",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.victimAddress = input;
                            //   },
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   // iconData: Icons.person,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),

                            // TextFieldWidgetSmall(
                            //   labelText: "এমপিওভুক্তির তারিখ",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.victimAddress = input;
                            //   },
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   // iconData: Icons.person,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),

                            // TextFieldWidgetSmall(
                            //   labelText: "মোট এমপিওভুক্ত শিক্ষা প্রতিষ্ঠানের সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '10',
                            //   onChanged: (input) {
                            //     controller.victimAddress = input;
                            //   },
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   // iconData: Icons.person,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),


                            // TextFieldWidget(
                            //   labelText: "মোট স্বীকৃতিপ্রাপ্ত শিক্ষা প্রতিষ্ঠানের সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '10',
                            //   onChanged: (input) {
                            //     controller.victimAddress = input;
                            //   },
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   // iconData: Icons.person,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),



                            // TextFieldWidget(
                            //   labelText: "এমপিওভুক্ত নয় কিন্তু স্বীকৃতিপ্রাপ্ত এমন শিক্ষা প্রতিষ্ঠানের সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '60',
                            //   onChanged: (input) {
                            //     controller.victimAddress = input;
                            //   },
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   // iconData: Icons.person,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            TextFieldWidgetSmall(
                              labelText: "শিক্ষা প্রতিষ্ঠান প্রধানের নাম",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.instiruteHeadName = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.person,
                              //iconData: IconData,
                              isFirst: true,
                              isLast: false,
                            ),
                            TextFieldWidgetSmall(
                              labelText: "শিক্ষা প্রতিষ্ঠান প্রধানের মোবাইল নম্বর",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.instiruteHeadMobile = input;
                              },
                              keyboardType: TextInputType.phone,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "মোট শিক্ষক-শিক্ষিকার সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.teacherCount = input;
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                             // iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "মোট শিক্ষিকার সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.femaleteacherCount = input;
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "মোট ছাত্র-ছাত্রীর সংখ্যা",
                              hintText: "",
                              initialValue: '${controller.totalStudent.value}',
                              onChanged: (input) {
                                controller.totalStudent.value = input as int;
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "মোট ছাত্রীর সংখ্যা",
                              hintText: "",
                              initialValue: '${controller.totalFemaleStudent.value}',
                              onChanged: (input) {
                                controller.totalFemaleStudent.value = input as int;
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),


                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: Get.size.width,
                                decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'মোট পরীক্ষার্থীর সংখ্যা',
                                        style: TextStyle(fontSize: 20,color: Colors.teal),
                                      ),

                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Table(
                                        columnWidths: const {
                                          0: FlexColumnWidth(70),
                                          1: FlexColumnWidth(30)
                                        },
                                        children: [

                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('দাখিল',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "0",
                                                      //hintStyle:

                                                    ),
                                                    onChanged: (text){
                                                      controller.dakhilexmineeCount = text.toString();

                                                      print('dakhilexmineeCount: ${controller.dakhilexmineeCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('আলিম',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('ফাজিল',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),

                                                    onChanged: (text){
                                                      controller.fazilexmineeCount = text.toString();

                                                      print('fazilexmineeCount: ${controller.fazilexmineeCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('ভোকেশনাল',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),

                                                    onChanged: (text){
                                                      controller.vocexmineeCount = text.toString();

                                                      print('vocexmineeCount: ${controller.vocexmineeCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('বিএম',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),
                                                    onChanged: (text){
                                                      controller.bmExmineeCount = text.toString();

                                                      print('vocexmineeCount: ${controller.bmExmineeCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                        ],
                                        border: TableBorder.all(width: 1, color: Colors.black),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),



                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: Get.size.width,
                                decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'মোট পাশের সংখ্যা',
                                        style: TextStyle(fontSize: 18,color: Colors.teal),
                                      ),

                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Table(
                                        columnWidths: const {
                                          0: FlexColumnWidth(70),
                                          1: FlexColumnWidth(30)
                                        },
                                        children:  [

                                          TableRow(

                                              children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                              child:
                                              Text('দাখিল',
                                                //textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                              child: TextField(
                                                //controller: "",
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                 // labelText: '60',
                                                  hintText: "",
                                                  //hintStyle:

                                                ),

                                                onChanged: (text){
                                                  controller.dakhilPassCount = text.toString();

                                                  print('dakhilPassCount: ${controller.dakhilPassCount}');
                                                },
                                              ),
                                            )
                                          ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('আলিম',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),
                                                    onChanged: (text){
                                                      controller.alimPassCount = text.toString();

                                                      print('alimPassCount: ${controller.alimPassCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('ফাজিল',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),

                                                    onChanged: (text){
                                                      controller.fazilPassCount = text.toString();

                                                      print('fazilPassCount: ${controller.fazilPassCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('ভোকেশনাল',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),

                                                    onChanged: (text){
                                                      controller.vocPassCount = text.toString();

                                                      print('vocPassCount: ${controller.vocPassCount}');
                                                    },
                                                  ),
                                                )
                                              ]),
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('বিএম',
                                                    //textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                                                  child: TextField(
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      // labelText: '60',
                                                      hintText: "",
                                                      //hintStyle:

                                                    ),

                                                    onChanged: (text){
                                                      controller.bmPassCount = text.toString();

                                                      print('bmPassCount: ${controller.bmPassCount}');
                                                    },
                                                  ),
                                                )
                                              ]),

                                        ],
                                        border: TableBorder.all(width: 1, color: Colors.black),
                                      ),
                                    )


                                    // TextFieldWidgetSmall(
                                    //   labelText: "দাখিল",
                                    //   hintText: "",
                                    //   initialValue: '5',
                                    //   onChanged: (input) {
                                    //     controller.victimAddress = input;
                                    //   },
                                    //   // limit: 255,
                                    //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    //   //iconData: Icons.phone_android,
                                    //   isFirst: true,
                                    //   isLast: false,
                                    // ),
                                    //
                                    // TextFieldWidgetSmall(
                                    //   labelText: "আলিম",
                                    //   hintText: "",
                                    //   initialValue: '5',
                                    //   onChanged: (input) {
                                    //     controller.victimAddress = input;
                                    //   },
                                    //   // limit: 255,
                                    //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    //   //iconData: Icons.phone_android,
                                    //   isFirst: true,
                                    //   isLast: false,
                                    // ),
                                    //
                                    // TextFieldWidgetSmall(
                                    //   labelText: "ফাজিল",
                                    //   hintText: "",
                                    //   initialValue: '5',
                                    //   onChanged: (input) {
                                    //     controller.victimAddress = input;
                                    //   },
                                    //   // limit: 255,
                                    //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    //   //iconData: Icons.phone_android,
                                    //   isFirst: true,
                                    //   isLast: false,
                                    // ),
                                    //
                                    // TextFieldWidgetSmall(
                                    //   labelText: "ভোকেশনাল",
                                    //   hintText: "",
                                    //   initialValue: '5',
                                    //   onChanged: (input) {
                                    //     controller.victimAddress = input;
                                    //   },
                                    //   // limit: 255,
                                    //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    //   //iconData: Icons.phone_android,
                                    //   isFirst: true,
                                    //   isLast: false,
                                    // ),
                                    //
                                    // TextFieldWidgetSmall(
                                    //   labelText: "বিএম",
                                    //   hintText: "",
                                    //   initialValue: '5',
                                    //   onChanged: (input) {
                                    //     controller.victimAddress = input;
                                    //   },
                                    //   // limit: 255,
                                    //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    //   //iconData: Icons.phone_android,
                                    //   isFirst: true,
                                    //   isLast: false,
                                    // ),


                                  ],
                                ),
                              ),
                            ),


                            TextFieldWidgetSmall(
                              labelText: "মাল্টিমিডিয়া ক্লাসরুমের সংখ্যা",
                              hintText: "",
                              initialValue: controller.multimediaRoomCount.toString(),
                              onChanged: (input) {
                                controller.multimediaRoomCount.value = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "শেখ রাসেল ডিজিটাল ল্যাব এর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.skRaselLabCount.value = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "কোভিড ১৯ ভ্যাকসিন গ্রহণকারী শিক্ষার্থীর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.covidVacCount.value = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidget(
                              labelText: "ইন্টারনেট আছে কি নেই",
                              hintText: "ইন্টারনেট আছে কি নেই",
                              //initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                 controller.IsInternet.value = input!;
                                // print(controller.IsStatePlaintiffCase);
                              },
                              //  iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidget(
                              labelText: "ইলেক্ট্রিসিটি আছে কি নেই",
                              hintText: "ইন্টারনেট আছে কি নেই",
                              initialValue: 'হ্যাঁ',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                 controller.IsElectricity.value = input!;
                                 print(controller.IsElectricity);
                              },
                              // iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),



                            DropDownWidget(
                              labelText: "শিক্ষকদের কোন প্রশিক্ষণ আছে কি না?",
                              hintText: "শিক্ষকদের কোন প্রশিক্ষণ আছে কি না?",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                controller.IsTecherTraining.value = input!;
                                print(controller.IsTecherTraining);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidget(
                              labelText: "প্রতিষ্ঠানের পরিষ্কার-পরিচ্ছন্নতার পদক্ষেপ গ্রহণ করা হয়েছে?",
                              hintText: "প্রতিষ্ঠানের পরিষ্কার-পরিচ্ছন্নতার পদক্ষেপ গ্রহণ করা হয়েছে?",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                 controller.IsCleanActivity.value = input!;
                                // print(controller.IsStatePlaintiffCase);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "প্রতিষ্ঠানের পরিষ্কার-পরিচ্ছন্নতার বিষয়ে কি পদক্ষেপ গ্রহণ করা হয়েছে?",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.cleanActivity = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),


                            TextFieldWidgetSmall(
                              labelText: "শিক্ষকদের আইসিটি সংক্রান্ত কী কী প্রশিক্ষণ রয়েছে?",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.techerIctTraining = input;
                              },
                               limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),
                            // DropDownWidgetMenu(
                            //   labelText: "শিক্ষকদের আইসিটি সংক্রান্ত কী কী প্রশিক্ষণ রয়েছে?",
                            //   hintText: "শিক্ষকদের আইসিটি সংক্রান্ত কী কী প্রশিক্ষণ রয়েছে?",
                            //   initialValue: '',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     controller.IsStatePlaintiffCase.value = input!;
                            //     print(controller.IsStatePlaintiffCase);
                            //   },
                            //   //iconData: Icons.merge_type,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),

                            DropDownWidgetMenu(
                              labelText: "অভিভাবক সমাবেশ হয়েছে কি না?",
                              hintText: "অভিভাবক সমাবেশ হয়েছে কি না?",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                controller.IsInternet.value = input!;
                                print(controller.IsInternet);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                      MultipleSelectionDropDownWidget(
                              labelText: "প্রতিষ্ঠানে কী কী কো-কারিকুলাম কার্যকর রয়েছে?",
                              hintText: "প্রতিষ্ঠানে কী কী কো-কারিকুলাম কার্যকর রয়েছে?",
                              initialValue: '',
                              data: controller.types_of_co_karikulam.map((item) => item['title']!).toList(),
                              onChanged: (input) {
                                for (var item in controller.types_of_co_karikulam) {
                                  if (item['title'] == input.toString().trim()) {
                                    controller.type_of_co_karikulam.value = item['id']!;
                                  }
                                }
                                print('union_name: ${controller.type_of_co_karikulam.value}');
                              },
                              iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),



    //                         controller.IsStatePlaintiffCase.value == 'হ্যাঁ'
    //                             ? TextFieldWidget(
    //                           labelText: "Nationalist case's details *".tr,
    //                           hintText: "Enter details".tr,
    //                           initialValue: '',
    //                           onChanged: (input) {
    //                             controller.StatePlaintiffCaseDescription.value = input;
    //                           },
    //                           limit: 255,
    //                           validator: (input) => controller.IsStatePlaintiffCase.value == 'হ্যাঁ' && input!.isEmpty ? "This field Shouldn't be empty".tr : null,
    //                           iconData: Icons.description,
    //                           isFirst: true,
    //                           isLast: false,
    //                         )
    //                             : Wrap(),
    //                         TextFieldWidget(
    //                           labelText: "Information Source".tr,
    //                           hintText: "Enter information source".tr,
    //                           initialValue: '',
    //                           onChanged: (input) {
    //                             controller.informationSource.value = input;
    //                             controller.count.value = 1;
    //                           },
    //                           limit: 255,
    //                           validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
    //                           iconData: controller.count.value == 0 ? Icons.description : Icons.description,
    //                           isFirst: true,
    //                           isLast: false,
    //                         ),
    //                       ],
    //                     );
    //                   }),
    //             SizedBox(
    //               height: 10,
    //             ),
    //             ],
    //           ),
    //         ),
    // ),


                            // Obx(() =>Padding(
                            //   padding: const EdgeInsets.all(20),
                            //   child:
                            //   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            //     const Text(
                            //       'Choose your hobbies:',
                            //       style: TextStyle(fontSize: 24),
                            //     ),
                            //     const SizedBox(height: 10),
                            //     const Divider(),
                            //     const SizedBox(height: 10),
                            //
                            //     // The checkboxes will be here
                            //     Column(
                            //         children: controller.availableHobbies.map((hobby) {
                            //           return CheckboxListTile(
                            //               value: hobby["isChecked"],
                            //               title: Text(hobby["name"]),
                            //               onChanged: (newValue) {
                            //                 // for (var item in controller.availableHobbies) {
                            //                 //   if (item['name'] == hobby["name"]) {
                            //                 //     hobby["isChecked"] = newValue;
                            //                 //     controller.availableHobbies[0] = hobby;
                            //                 //   }
                            //                 // }
                            //
                            //                 print('isChecked: ${newValue}');
                            //                 //setState(() {
                            //
                            //                 hobby["isChecked"] = newValue;
                            //                // controller.availableHobbies[0] = hobby;
                            //
                            //                 //});
                            //               });
                            //         }).toList()),
                            //
                            //     // Display the result here
                            //     const SizedBox(height: 10),
                            //     const Divider(),
                            //     const SizedBox(height: 10),
                            //     Wrap(
                            //       children: controller.availableHobbies.map((hobby) {
                            //         if (hobby["isChecked"] == true) {
                            //           return Card(
                            //             elevation: 3,
                            //             color: Colors.amber,
                            //             child: Padding(
                            //               padding: const EdgeInsets.all(8.0),
                            //               child: Text(hobby["name"]),
                            //             ),
                            //           );
                            //         }
                            //
                            //         return Container();
                            //       }).toList(),
                            //     )
                            //   ]),
                            // ),
                            // ),

                            DropDownWidget(
                              labelText: "শিক্ষার্থীদের প্রাথমিক স্বাস্থ্য পরিচর্যার বিষয়ে  ব্যবস্থা নেয়া হয়েছে?",
                              hintText: "শিক্ষার্থীদের প্রাথমিক স্বাস্থ্য পরিচর্যার বিষয়ে ব্যবস্থা নেয়া হয়েছে?",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                controller.IsPrimaryHealthActivity.value = input!;
                                print(controller.IsPrimaryHealthActivity);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),
                            Obx(() {
                              return Column(
                                children: [
                                  controller.IsPrimaryHealthActivity.value == 'হ্যাঁ'
                                      ? TextFieldWidgetSmall(
                                    labelText: "শিক্ষার্থীদের প্রাথমিক স্বাস্থ্য পরিচর্যার বিষয়ে কী ধরনের ব্যবস্থা নেয়া হয়েছে?",
                                    hintText: "বিবরণ লিখুন",
                                    initialValue: '',
                                    onChanged: (input) {
                                      controller.IsPrimaryHealthActivity.value = input;
                                    },
                                    limit: 255,
                                    validator: (input) => controller.IsPrimaryHealthActivity.value == 'হ্যাঁ' && input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    // iconData: Icons.description,
                                    isFirst: true,
                                    isLast: false,
                                  )
                                      : Wrap(),

                                  // TextFieldWidget(
                                  //   labelText: "Information Source".tr,
                                  //   hintText: "Enter information source".tr,
                                  //   initialValue: '',
                                  //   onChanged: (input) {
                                  //     controller.informationSource.value = input;
                                  //     controller.count.value = 1;
                                  //   },
                                  //   limit: 255,
                                  //   validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                  //   iconData: controller.count.value == 0 ? Icons.description : Icons.description,
                                  //   isFirst: true,
                                  //   isLast: false,
                                  // ),
                                ],
                              );
                            }),



                            DropDownWidget(
                              labelText: "ছাত্র-ছাত্রীদের মানসিক স্বাস্থ্য বিকাশে কোন কার্যক্রম গ্রহণ করা হয়েছে কি না? করা হলে সংক্ষিপ্ত বিবরণ",
                              hintText: "ছাত্র-ছাত্রীদের মানসিক স্বাস্থ্য বিকাশে কোন কার্যক্রম গ্রহণ করা হয়েছে কি না?",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                controller.IsMentalHealthActivity.value = input!;
                                print(controller.IsMentalHealthActivity);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),
                            Obx(() {
                              return Column(
                                children: [
                                  controller.IsMentalHealthActivity.value == 'হ্যাঁ'
                                      ? TextFieldWidgetSmall(
                                    labelText: "ছাত্র-ছাত্রীদের মানসিক স্বাস্থ্য বিকাশে কার্যক্রম",
                                    hintText: "বিবরণ লিখুন",
                                    initialValue: '',
                                    onChanged: (input) {
                                      controller.mentalHealthActivity = input;
                                    },
                                    limit: 255,
                                    validator: (input) => controller.IsMentalHealthActivity.value == 'হ্যাঁ' && input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                    // iconData: Icons.description,
                                    isFirst: true,
                                    isLast: false,
                                  )
                                      : Wrap(),

                                  // TextFieldWidget(
                                  //   labelText: "Information Source".tr,
                                  //   hintText: "Enter information source".tr,
                                  //   initialValue: '',
                                  //   onChanged: (input) {
                                  //     controller.informationSource.value = input;
                                  //     controller.count.value = 1;
                                  //   },
                                  //   limit: 255,
                                  //   validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                  //   iconData: controller.count.value == 0 ? Icons.description : Icons.description,
                                  //   isFirst: true,
                                  //   isLast: false,
                                  // ),
                                ],
                              );
                            }),


                            DropDownWidget(
                              labelText: "অনলাইন ক্লাস চলমান আছে কি না?",
                              hintText: "হ্যাঁ",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                controller.IsOnlineClass.value = input!;
                                print(controller.IsOnlineClass);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidget(
                              labelText: "পিছিয়ে পড়া/ঝরে পড়া ছাত্র-ছাত্রীদের বিষয়ে বিশেষ কোন উদ্যোগ গ্রহণ করা হয়েছে কি না ? থাকলে তার বিবরণ",
                              hintText: "পিছিয়ে পড়া/ঝরে পড়া ছাত্র-ছাত্রীদের বিষয়ে বিশেষ কোন উদ্যোগ গ্রহণ করা হয়েছে কি না ?",
                              initialValue: '',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                controller.IsPichiyePoraJorePora.value = input!;
                                print(controller.IsPichiyePoraJorePora);
                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),


                            Obx(() {
                              return Column(
                                children: [
                                  controller.IsPichiyePoraJorePora.value == 'হ্যাঁ'
                                      ? TextFieldWidgetSmall(
                                    labelText: "বিবরণ লিখুন",
                                    hintText: "বিবরণ লিখুন",
                                    initialValue: '',
                                    onChanged: (input) {
                                      controller.StatePlaintiffCaseDescription.value = input;
                                    },
                                    limit: 255,
                                    validator: (input) => controller.IsPichiyePoraJorePora.value == 'হ্যাঁ' && input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                   // iconData: Icons.description,
                                    isFirst: true,
                                    isLast: false,
                                  )
                                      : Wrap(),

                                  // TextFieldWidget(
                                  //   labelText: "Information Source".tr,
                                  //   hintText: "Enter information source".tr,
                                  //   initialValue: '',
                                  //   onChanged: (input) {
                                  //     controller.informationSource.value = input;
                                  //     controller.count.value = 1;
                                  //   },
                                  //   limit: 255,
                                  //   validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                                  //   iconData: controller.count.value == 0 ? Icons.description : Icons.description,
                                  //   isFirst: true,
                                  //   isLast: false,
                                  // ),
                                ],
                              );
                            }),


                            MultipleSelectionDropDownWidget(
                              labelText: "ছাত্র-ছাত্রীদের সফট স্কিল /English Language skill বিষয়ে কী ধরনের কার্যক্রম গ্রহণ করাহয়েছে তার বিবরণ",
                              hintText: "ছাত্র-ছাত্রীদের সফট স্কিল /English Language skill",
                              initialValue: '',
                              data: controller.types_of_co_karikulam.map((item) => item['title']!).toList(),
                              onChanged: (input) {
                                for (var item in controller.types_of_co_karikulam) {
                                  if (item['title'] == input.toString().trim()) {
                                    controller.type_of_co_karikulam.value = item['id']!;
                                  }
                                }
                                print('union_name: ${controller.type_of_co_karikulam.value}');
                              },
                              iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),


                            MultipleSelectionDropDownWidget(
                              labelText: "শিক্ষার্থীদের প্রাথমিক স্বাস্থ্য পরিচর্যার বিষয়ে কী ধরনের ব্যবস্থা নেয়া হয়েছে?",
                              hintText: "শিক্ষার্থীদের প্রাথমিক স্বাস্থ্য পরিচর্যা",
                              initialValue: '',
                              data: controller.types_of_co_karikulam.map((item) => item['title']!).toList(),
                              onChanged: (input) {
                                for (var item in controller.types_of_co_karikulam) {
                                  if (item['title'] == input.toString().trim()) {
                                    controller.type_of_co_karikulam.value = item['id']!;
                                  }
                                }
                                print('union_name: ${controller.type_of_co_karikulam.value}');
                              },
                              iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),





                            GestureDetector(
                              onTap: () {
                                if (controller.infoFormKey.currentState!.validate()) {
                                  controller.addData();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        Colors.green,
                                        Colors.green
                                        // Color.fromRGBO(143, 148, 251, 1),
                                        // Color.fromRGBO(143, 148, 251, .6),
                                      ])),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}