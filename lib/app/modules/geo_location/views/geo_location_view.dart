import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../common/ui.dart';
import '../../global_widgets/dropdown_widget_small.dart';
import '../controllers/geo_location_controller.dart';

class GeoLocationView extends GetView<GeoLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(60,55),
        child:  AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            centerTitle: true,
            title: Text('দুরত্ব পরিমাপ')
        ),
      ),
      body: Obx(() {
        return LoadingOverlay(
          child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: Get.size.width,
                        decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'বর্তমান অবস্থান থেকে প্রতিষ্ঠানের দুরত্ব পরিমাপ',
                                style: TextStyle(fontSize: 15,color: Colors.deepPurple),
                                textAlign: TextAlign.center,
                              ),

                            ),

                            Obx(
                                  () => Column(
                                children: [
                                  Text(
                                    controller.address.value,
                                    style: TextStyle(color: Colors.black, fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),

                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

                                      children: [
                                        Container(
                                          width: 180,
                                          child: dropdown_widget_small(
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
                                              // controller.fetchJoke();
                                             // controller.placeLoaded.value = false;
                                              //controller.getInsPectionListDivision();

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
                                        ),
                                        Container(
                                          width: 180,
                                          child: dropdown_widget_small(
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
                                                  //controller.inspectionData.value.district_id = item.id;
                                                }
                                              }
                                              //controller.placeLoaded.value = false;
                                              controller.thanaList.clear();
                                              for (var itemd in controller.allDivDisTana.value.thana_list!) {
                                                //print('divisionId: ${controller.victimDivision.value}');
                                                if (itemd.district_id.toString() == controller.victimDistrict.value.toString().trim()) {
                                                  print('districtIddd: ${controller.victimDivision.value}');
                                                  //controller.victimDivision.value = item.id.toString();
                                                  controller.thanaList.add(itemd);

                                                }
                                              }
                                              //controller.getInsPectionListDistrictd();
                                              // controller.getLocationData();
                                              print('district: ${controller.victimDistrict.value}');
                                            },
                                            isFirst: true,
                                            isLast: false,
                                          ),
                                        ),

                                      ],
                                    ),

                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      Container(
                                        width: 180,
                                        child: dropdown_widget_small(
                                          labelText: "উপজেলা",
                                          hintText: "উপজেলা নির্বাচন করুন",
                                          initialValue: '',
                                          iconData: Icons.phone_android,
                                          data: controller.thanaList?.map((item) => item.name!).toList(),
                                          onChanged: (input) {
                                            for (var item in controller.thanaList) {
                                              if (item.name == input) {
                                                controller.instituteUpazila.value = item.id!.toString();
                                                //controller.inspectionData.value.thana_id = item.id;
                                              }
                                            }
                                            // controller.getLocationData();
                                            print('upazila: ${controller.instituteUpazila.value}');
                                            //controller.placeLoaded.value = false;
                                            // controller.getInsPectionListThana();

                                          },
                                          isFirst: true,
                                          isLast: false,
                                        ),
                                      ),
                                      Container(
                                        width: 180,
                                        child: dropdown_widget_small(
                                          labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
                                          hintText: "প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
                                          initialValue: '',
                                          iconData: Icons.phone_android,
                                          data: controller.allInstype.value.institute__type_list?.map((item) => item.name!).toList(),
                                          onChanged: (input) {
                                            for (var item in controller.allInstype.value.institute__type_list!) {
                                              if (item.name == input) {
                                                controller.instituteTypeId.value = item.id!.toString();
                                                // controller.inspectionData.value.institute_type = item.id;

                                              }
                                            }
                                            //controller.getLocationData();
                                            //print('union_ id: ${controller.victimUnion.value}');
                                            controller.placeLoaded.value = true;
                                            controller.getInstitute();

                                            //controller.getInsPectionListType();
                                          },
                                          isFirst: true,
                                          isLast: false,
                                        ),
                                      ),

                                    ],
                                  ),

                                  dropdown_widget_small(
                                    labelText: "শিক্ষা প্রতিষ্ঠানের নাম",
                                    hintText: "শিক্ষা প্রতিষ্ঠানের নাম নির্বাচন করুন",
                                    initialValue: '',
                                    iconData: Icons.phone_android,
                                    data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
                                    onChanged: (input) {

                                      for (var item in controller.instituteData.value.institute_list!) {
                                        if (item.name == input) {
                                          controller.instituteID.value = item.id!.toString();
                                          //controller.inspectionData.value.institute_id = item.id;
                                        }
                                      }

                                      controller.calculateDistance(controller.currentLatitude.value,controller.currentLongitude.value,23.787714006390217,90.44380909448905);
                                      //controller.placeLoaded.value = false;
                                      //controller.getInsPectionListInstituteId();

                                      // for (var item in controller.allStudentData.value.students!) {
                                      //   if (item.thana_id == controller.instituteUpazila.value && item.institute_type_id == controller.instituteTypeId) {
                                      //     controller.totalStudent.value = item.total! as int;
                                      //     controller.totalFemaleStudent.value = item.total_girls! as int;
                                      //   }
                                      // }

                                      //controller.totalBoyStudent.value = controller.totalStudent.value - controller.totalFemaleStudent.value ;

                                      // controller.getLocationData();
                                      // print('union_ id: ${controller.victimUnion.value}');
                                    },
                                    isFirst: true,
                                    isLast: false,
                                  ),

                                  SizedBox(
                                    height: 20.0,
                                  ),

                                  Text("দূরত্ব (কি মি) : ${controller.totalDistance.value} ",
                                    style: TextStyle(fontSize: 15),
                                  ),

                                  // Text("দূরত্ব (মাইল) : ${controller.distance.value} ",
                                  //   style: TextStyle(fontSize: 15),
                                  // ),

                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),

                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: Get.size.width,
                        decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'প্রতিষ্ঠান থেকে প্রতিষ্ঠানের দুরত্ব পরিমাপ',
                                style: TextStyle(fontSize: 18,color: Colors.black),
                                textAlign: TextAlign.center,
                              ),

                            ),

                            Obx(
                                  () => Column(
                                children: [
                                  // Text(
                                  //   controller.address.value,
                                  //   style: TextStyle(color: Colors.black, fontSize: 15),
                                  //   //textAlign: ,
                                  // ),

                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

                                      children: [
                                        Container(
                                          width: 180,
                                          child: dropdown_widget_small(
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
                                              // controller.fetchJoke();
                                             // controller.placeLoaded.value = false;
                                              //controller.getInsPectionListDivision();

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
                                        ),
                                        Container(
                                          width: 180,
                                          child: dropdown_widget_small(
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
                                                  //controller.inspectionData.value.district_id = item.id;
                                                }
                                              }
                                              //controller.placeLoaded.value = false;
                                              controller.thanaList.clear();
                                              for (var itemd in controller.allDivDisTana.value.thana_list!) {
                                                //print('divisionId: ${controller.victimDivision.value}');
                                                if (itemd.district_id.toString() == controller.victimDistrict.value.toString().trim()) {
                                                  print('districtIddd: ${controller.victimDivision.value}');
                                                  //controller.victimDivision.value = item.id.toString();
                                                  controller.thanaList.add(itemd);

                                                }
                                              }
                                              //controller.getInsPectionListDistrictd();
                                              // controller.getLocationData();
                                              print('district: ${controller.victimDistrict.value}');
                                            },
                                            isFirst: true,
                                            isLast: false,
                                          ),
                                        ),

                                      ],
                                    ),

                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      Container(
                                        width: 180,
                                        child: dropdown_widget_small(
                                          labelText: "উপজেলা",
                                          hintText: "উপজেলা নির্বাচন করুন",
                                          initialValue: '',
                                          iconData: Icons.phone_android,
                                          data: controller.thanaList?.map((item) => item.name!).toList(),
                                          onChanged: (input) {
                                            for (var item in controller.thanaList) {
                                              if (item.name == input) {
                                                controller.instituteUpazila.value = item.id!.toString();
                                                //controller.inspectionData.value.thana_id = item.id;
                                              }
                                            }
                                            // controller.getLocationData();
                                            print('upazila: ${controller.instituteUpazila.value}');
                                            //controller.placeLoaded.value = false;
                                            // controller.getInsPectionListThana();

                                          },
                                          isFirst: true,
                                          isLast: false,
                                        ),
                                      ),
                                      Container(
                                        width: 180,
                                        child: dropdown_widget_small(
                                          labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
                                          hintText: "প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
                                          initialValue: '',
                                          iconData: Icons.phone_android,
                                          data: controller.allInstype.value.institute__type_list?.map((item) => item.name!).toList(),
                                          onChanged: (input) {
                                            for (var item in controller.allInstype.value.institute__type_list!) {
                                              if (item.name == input) {
                                                controller.instituteTypeId.value = item.id!.toString();
                                                // controller.inspectionData.value.institute_type = item.id;

                                              }
                                            }
                                            //controller.getLocationData();
                                            //print('union_ id: ${controller.victimUnion.value}');
                                            //controller.getInstitute();
                                            //controller.placeLoaded.value = false;
                                            //controller.getInsPectionListType();
                                          },
                                          isFirst: true,
                                          isLast: false,
                                        ),
                                      ),

                                    ],
                                  ),

                                  dropdown_widget_small(
                                    labelText: "প্রারম্ভিক শিক্ষা প্রতিষ্ঠানের নাম",
                                    hintText: "প্রারম্ভিক শিক্ষা প্রতিষ্ঠানের নাম নির্বাচন করুন",
                                    initialValue: '',
                                    iconData: Icons.phone_android,
                                    data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
                                    onChanged: (input) {

                                      for (var item in controller.instituteData.value.institute_list!) {
                                        if (item.name == input) {
                                          controller.instituteID.value = item.id!.toString();
                                          //controller.inspectionData.value.institute_id = item.id;
                                        }
                                      }

                                      //controller.placeLoaded.value = false;
                                      //controller.getInsPectionListInstituteId();

                                      // for (var item in controller.allStudentData.value.students!) {
                                      //   if (item.thana_id == controller.instituteUpazila.value && item.institute_type_id == controller.instituteTypeId) {
                                      //     controller.totalStudent.value = item.total! as int;
                                      //     controller.totalFemaleStudent.value = item.total_girls! as int;
                                      //   }
                                      // }

                                      //controller.totalBoyStudent.value = controller.totalStudent.value - controller.totalFemaleStudent.value ;

                                      // controller.getLocationData();
                                      // print('union_ id: ${controller.victimUnion.value}');
                                    },
                                    isFirst: true,
                                    isLast: false,
                                  ),

                                  dropdown_widget_small(
                                    labelText: "গন্তব্য শিক্ষা প্রতিষ্ঠানের নাম",
                                    hintText: "গন্তব্য শিক্ষা প্রতিষ্ঠানের নাম নির্বাচন করুন",
                                    initialValue: '',
                                    iconData: Icons.phone_android,
                                    data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
                                    onChanged: (input) {

                                      for (var item in controller.instituteData.value.institute_list!) {
                                        if (item.name == input) {
                                          controller.instituteID.value = item.id!.toString();
                                          //controller.inspectionData.value.institute_id = item.id;
                                        }
                                      }

                                      //controller.placeLoaded.value = false;
                                      //controller.getInsPectionListInstituteId();

                                      // for (var item in controller.allStudentData.value.students!) {
                                      //   if (item.thana_id == controller.instituteUpazila.value && item.institute_type_id == controller.instituteTypeId) {
                                      //     controller.totalStudent.value = item.total! as int;
                                      //     controller.totalFemaleStudent.value = item.total_girls! as int;
                                      //   }
                                      // }

                                      //controller.totalBoyStudent.value = controller.totalStudent.value - controller.totalFemaleStudent.value ;

                                      // controller.getLocationData();
                                      // print('union_ id: ${controller.victimUnion.value}');
                                    },
                                    isFirst: true,
                                    isLast: false,
                                  ),


                                  SizedBox(
                                    height: 20.0,
                                  ),

                                  Text("প্রারম্ভিক প্রতিষ্ঠান :  ${controller.paromvikInstitute.value} ",
                                    style: TextStyle(fontSize: 15),
                                  ),

                                  Text("গন্তব্য প্রতিষ্ঠান :  ${controller.gonttoboInstitute.value} ",
                                    style: TextStyle(fontSize: 15),
                                  ),


                                  SizedBox(
                                    height: 20.0,
                                  ),

                                // GestureDetector(
                                //   onTap: () {
                                //
                                //   },
                                //   child: Container(
                                //     height: 50,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(10),
                                //         gradient: LinearGradient(colors: [
                                //           //Color(0xffec008c),
                                //           Colors.green,
                                //           //Colors.pinkAccent.shade100
                                //           Colors.green
                                //           // Color.fromRGBO(143, 148, 251, 1),
                                //           // Color.fromRGBO(143, 148, 251, .6),
                                //         ])),
                                //     child: Center(
                                //       child: Text(
                                //         "দূরত্ব দেখুন",
                                //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                  Text("দূরত্ব (কি মি) : ${controller.distanceBtwTwoInsti.value} ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  // SizedBox(
                                  //   height: 5.0,
                                  // ),
                                  // Text("দূরত্ব (মাইল) : ${controller.distance.value} ",
                                  //   style: TextStyle(fontSize: 15),
                                  // ),

                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
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
          isLoading: controller.placeLoaded.value,
          // demo of some additional parameters
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
        );

        // Get.put(ProvidedDataListController()).count.value++;
        // if(controller.placeLoaded.isTrue){
        //   return ListView(
        //     children: [
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //
        //           SizedBox(
        //             height: 6,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(0.0),
        //             child: Container(
        //               margin: EdgeInsets.all(10.0),
        //               width: Get.size.width,
        //               decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //
        //                   Padding(
        //                     padding: const EdgeInsets.all(10.0),
        //                     child: Text(
        //                       'বর্তমান অবস্থান থেকে প্রতিষ্ঠানের দুরত্ব পরিমাপ',
        //                       style: TextStyle(fontSize: 15,color: Colors.deepPurple),
        //                       textAlign: TextAlign.center,
        //                     ),
        //
        //                   ),
        //
        //                   Obx(
        //                         () => Column(
        //                       children: [
        //                         Text(
        //                           controller.address.value,
        //                           style: TextStyle(color: Colors.black, fontSize: 15),
        //                           textAlign: TextAlign.center,
        //                         ),
        //
        //                         Center(
        //                           child: Row(
        //                             mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        //                             crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        //
        //                             children: [
        //                               Container(
        //                                 width: 180,
        //                                 child: dropdown_widget_small(
        //                                   labelText: "বিভাগ",
        //                                   hintText: "বিভাগ নির্বাচন করুন",
        //                                   initialValue: '',
        //
        //                                   //data: controller.places.value.area!.map((item) => item.divisionName!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
        //                                   data: controller.allDivDisTana!.value.division_list?.map((item) => item.name!).toList(),
        //                                   iconData: Icons.phone_android,
        //                                   onChanged: (input) {
        //
        //                                     // controller.victimDivisionName.value =input;
        //                                     for (var item in controller.allDivDisTana.value.division_list!) {
        //                                       if (item.name == input) {
        //                                         controller.victimDivision.value = item.id.toString();
        //                                         //controller.districtList.add(item);
        //                                       }
        //                                     }
        //                                     // controller.fetchJoke();
        //                                    // controller.placeLoaded.value = false;
        //                                     //controller.getInsPectionListDivision();
        //
        //                                     //controller.getAldivDis();
        //                                     print('divisionId: ${controller.victimDivision.value}');
        //                                     //print('district: ${controller.districtList[0].name}');
        //                                     controller.districtList.clear();
        //                                     for (var itemd in controller.allDivDisTana.value.district_list!) {
        //                                       //print('divisionId: ${controller.victimDivision.value}');
        //                                       if (itemd.division_id.toString() == controller.victimDivision.value.toString().trim()) {
        //                                         print('divisionIddd: ${controller.victimDivision.value}');
        //                                         //controller.victimDivision.value = item.id.toString();
        //                                         controller.districtList.add(itemd);
        //
        //                                       }
        //                                     }
        //                                     //print('district: ${controller.districtList[0].name}');
        //                                   },
        //                                   isFirst: true,
        //                                   isLast: false,
        //                                 ),
        //                               ),
        //                               Container(
        //                                 width: 180,
        //                                 child: dropdown_widget_small(
        //                                   labelText: "জেলা",
        //                                   hintText: "জেলা নির্বাচন করুন",
        //                                   initialValue: '',
        //                                   //data: controller.allDivDisTana!.value.district_list!.map((item) => item.name!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
        //                                   data: controller.districtList?.map((item) => item.name!).toList(),
        //
        //
        //                                   // data: controller.allDivDisTana!.value.district_list!
        //                                   //     .where((element) => element.division_id == controller.victimDivision.value)
        //                                   //     .map((item) => item.name!)
        //                                   //     .toList(),
        //                                   // .where((country) => controller.victimU.add(country.toString()))
        //                                   // .toList()
        //
        //                                   iconData: Icons.phone_android,
        //                                   onChanged: (input) {
        //                                     for (var item in controller.allDivDisTana.value.district_list!) {
        //                                       if (item.name == input) {
        //                                         controller.victimDistrict.value = item.id!.toString();
        //                                         //controller.inspectionData.value.district_id = item.id;
        //                                       }
        //                                     }
        //                                     //controller.placeLoaded.value = false;
        //                                     controller.thanaList.clear();
        //                                     for (var itemd in controller.allDivDisTana.value.thana_list!) {
        //                                       //print('divisionId: ${controller.victimDivision.value}');
        //                                       if (itemd.district_id.toString() == controller.victimDistrict.value.toString().trim()) {
        //                                         print('districtIddd: ${controller.victimDivision.value}');
        //                                         //controller.victimDivision.value = item.id.toString();
        //                                         controller.thanaList.add(itemd);
        //
        //                                       }
        //                                     }
        //                                     //controller.getInsPectionListDistrictd();
        //                                     // controller.getLocationData();
        //                                     print('district: ${controller.victimDistrict.value}');
        //                                   },
        //                                   isFirst: true,
        //                                   isLast: false,
        //                                 ),
        //                               ),
        //
        //                             ],
        //                           ),
        //
        //                         ),
        //
        //
        //
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        //                           crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        //                           children: [
        //                             Container(
        //                               width: 180,
        //                               child: dropdown_widget_small(
        //                                 labelText: "উপজেলা",
        //                                 hintText: "উপজেলা নির্বাচন করুন",
        //                                 initialValue: '',
        //                                 iconData: Icons.phone_android,
        //                                 data: controller.thanaList?.map((item) => item.name!).toList(),
        //                                 onChanged: (input) {
        //                                   for (var item in controller.thanaList) {
        //                                     if (item.name == input) {
        //                                       controller.instituteUpazila.value = item.id!.toString();
        //                                       //controller.inspectionData.value.thana_id = item.id;
        //                                     }
        //                                   }
        //                                   // controller.getLocationData();
        //                                   print('upazila: ${controller.instituteUpazila.value}');
        //                                   //controller.placeLoaded.value = false;
        //                                   // controller.getInsPectionListThana();
        //
        //                                 },
        //                                 isFirst: true,
        //                                 isLast: false,
        //                               ),
        //                             ),
        //                             Container(
        //                               width: 180,
        //                               child: dropdown_widget_small(
        //                                 labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
        //                                 hintText: "প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
        //                                 initialValue: '',
        //                                 iconData: Icons.phone_android,
        //                                 data: controller.allInstype.value.institute__type_list?.map((item) => item.name!).toList(),
        //                                 onChanged: (input) {
        //                                   for (var item in controller.allInstype.value.institute__type_list!) {
        //                                     if (item.name == input) {
        //                                       controller.instituteTypeId.value = item.id!.toString();
        //                                       // controller.inspectionData.value.institute_type = item.id;
        //
        //                                     }
        //                                   }
        //                                   //controller.getLocationData();
        //                                   //print('union_ id: ${controller.victimUnion.value}');
        //                                   controller.getInstitute();
        //                                   //controller.placeLoaded.value = false;
        //                                   //controller.getInsPectionListType();
        //                                 },
        //                                 isFirst: true,
        //                                 isLast: false,
        //                               ),
        //                             ),
        //
        //                           ],
        //                         ),
        //
        //                         dropdown_widget_small(
        //                           labelText: "শিক্ষা প্রতিষ্ঠানের নাম",
        //                           hintText: "শিক্ষা প্রতিষ্ঠানের নাম নির্বাচন করুন",
        //                           initialValue: '',
        //                           iconData: Icons.phone_android,
        //                           data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
        //                           onChanged: (input) {
        //
        //                             for (var item in controller.instituteData.value.institute_list!) {
        //                               if (item.name == input) {
        //                                 controller.instituteID.value = item.id!.toString();
        //                                 //controller.inspectionData.value.institute_id = item.id;
        //                               }
        //                             }
        //
        //                             //controller.placeLoaded.value = false;
        //                             //controller.getInsPectionListInstituteId();
        //
        //                             // for (var item in controller.allStudentData.value.students!) {
        //                             //   if (item.thana_id == controller.instituteUpazila.value && item.institute_type_id == controller.instituteTypeId) {
        //                             //     controller.totalStudent.value = item.total! as int;
        //                             //     controller.totalFemaleStudent.value = item.total_girls! as int;
        //                             //   }
        //                             // }
        //
        //                             //controller.totalBoyStudent.value = controller.totalStudent.value - controller.totalFemaleStudent.value ;
        //
        //                             // controller.getLocationData();
        //                             // print('union_ id: ${controller.victimUnion.value}');
        //                           },
        //                           isFirst: true,
        //                           isLast: false,
        //                         ),
        //
        //                         SizedBox(
        //                           height: 20.0,
        //                         ),
        //
        //                         Text("দূরত্ব (কি মি) : ${controller.distance.value} ",
        //                           style: TextStyle(fontSize: 15),
        //                         ),
        //
        //                         Text("দূরত্ব (মাইল) : ${controller.distance.value} ",
        //                           style: TextStyle(fontSize: 15),
        //                         ),
        //
        //                         SizedBox(
        //                           height: 20.0,
        //                         ),
        //                       ],
        //                     ),
        //
        //
        //
        //
        //                   ),
        //
        //                 ],
        //               ),
        //             ),
        //           ),
        //
        //         ],
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //
        //           SizedBox(
        //             height: 6,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(0.0),
        //             child: Container(
        //               margin: EdgeInsets.all(10.0),
        //               width: Get.size.width,
        //               decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //
        //                   Padding(
        //                     padding: const EdgeInsets.all(10.0),
        //                     child: Text(
        //                       'প্রতিষ্ঠান থেকে প্রতিষ্ঠানের দুরত্ব পরিমাপ',
        //                       style: TextStyle(fontSize: 18,color: Colors.black),
        //                       textAlign: TextAlign.center,
        //                     ),
        //
        //                   ),
        //
        //                   Obx(
        //                         () => Column(
        //                       children: [
        //                         // Text(
        //                         //   controller.address.value,
        //                         //   style: TextStyle(color: Colors.black, fontSize: 15),
        //                         //   //textAlign: ,
        //                         // ),
        //
        //                         Center(
        //                           child: Row(
        //                             mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        //                             crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        //
        //                             children: [
        //                               Container(
        //                                 width: 180,
        //                                 child: dropdown_widget_small(
        //                                   labelText: "বিভাগ",
        //                                   hintText: "বিভাগ নির্বাচন করুন",
        //                                   initialValue: '',
        //
        //                                   //data: controller.places.value.area!.map((item) => item.divisionName!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
        //                                   data: controller.allDivDisTana!.value.division_list?.map((item) => item.name!).toList(),
        //                                   iconData: Icons.phone_android,
        //                                   onChanged: (input) {
        //
        //                                     // controller.victimDivisionName.value =input;
        //                                     for (var item in controller.allDivDisTana.value.division_list!) {
        //                                       if (item.name == input) {
        //                                         controller.victimDivision.value = item.id.toString();
        //                                         //controller.districtList.add(item);
        //                                       }
        //                                     }
        //                                     // controller.fetchJoke();
        //                                     controller.placeLoaded.value = false;
        //                                     //controller.getInsPectionListDivision();
        //
        //                                     //controller.getAldivDis();
        //                                     print('divisionId: ${controller.victimDivision.value}');
        //                                     //print('district: ${controller.districtList[0].name}');
        //                                     controller.districtList.clear();
        //                                     for (var itemd in controller.allDivDisTana.value.district_list!) {
        //                                       //print('divisionId: ${controller.victimDivision.value}');
        //                                       if (itemd.division_id.toString() == controller.victimDivision.value.toString().trim()) {
        //                                         print('divisionIddd: ${controller.victimDivision.value}');
        //                                         //controller.victimDivision.value = item.id.toString();
        //                                         controller.districtList.add(itemd);
        //
        //                                       }
        //                                     }
        //                                     //print('district: ${controller.districtList[0].name}');
        //                                   },
        //                                   isFirst: true,
        //                                   isLast: false,
        //                                 ),
        //                               ),
        //                               Container(
        //                                 width: 180,
        //                                 child: dropdown_widget_small(
        //                                   labelText: "জেলা",
        //                                   hintText: "জেলা নির্বাচন করুন",
        //                                   initialValue: '',
        //                                   //data: controller.allDivDisTana!.value.district_list!.map((item) => item.name!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
        //                                   data: controller.districtList?.map((item) => item.name!).toList(),
        //
        //
        //                                   // data: controller.allDivDisTana!.value.district_list!
        //                                   //     .where((element) => element.division_id == controller.victimDivision.value)
        //                                   //     .map((item) => item.name!)
        //                                   //     .toList(),
        //                                   // .where((country) => controller.victimU.add(country.toString()))
        //                                   // .toList()
        //
        //                                   iconData: Icons.phone_android,
        //                                   onChanged: (input) {
        //                                     for (var item in controller.allDivDisTana.value.district_list!) {
        //                                       if (item.name == input) {
        //                                         controller.victimDistrict.value = item.id!.toString();
        //                                         //controller.inspectionData.value.district_id = item.id;
        //                                       }
        //                                     }
        //                                     controller.placeLoaded.value = false;
        //                                     controller.thanaList.clear();
        //                                     for (var itemd in controller.allDivDisTana.value.thana_list!) {
        //                                       //print('divisionId: ${controller.victimDivision.value}');
        //                                       if (itemd.district_id.toString() == controller.victimDistrict.value.toString().trim()) {
        //                                         print('districtIddd: ${controller.victimDivision.value}');
        //                                         //controller.victimDivision.value = item.id.toString();
        //                                         controller.thanaList.add(itemd);
        //
        //                                       }
        //                                     }
        //                                     //controller.getInsPectionListDistrictd();
        //                                     // controller.getLocationData();
        //                                     print('district: ${controller.victimDistrict.value}');
        //                                   },
        //                                   isFirst: true,
        //                                   isLast: false,
        //                                 ),
        //                               ),
        //
        //                             ],
        //                           ),
        //
        //                         ),
        //
        //
        //
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        //                           crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        //                           children: [
        //                             Container(
        //                               width: 180,
        //                               child: dropdown_widget_small(
        //                                 labelText: "উপজেলা",
        //                                 hintText: "উপজেলা নির্বাচন করুন",
        //                                 initialValue: '',
        //                                 iconData: Icons.phone_android,
        //                                 data: controller.thanaList?.map((item) => item.name!).toList(),
        //                                 onChanged: (input) {
        //                                   for (var item in controller.thanaList) {
        //                                     if (item.name == input) {
        //                                       controller.instituteUpazila.value = item.id!.toString();
        //                                       //controller.inspectionData.value.thana_id = item.id;
        //                                     }
        //                                   }
        //                                   // controller.getLocationData();
        //                                   print('upazila: ${controller.instituteUpazila.value}');
        //                                   controller.placeLoaded.value = false;
        //                                   // controller.getInsPectionListThana();
        //
        //                                 },
        //                                 isFirst: true,
        //                                 isLast: false,
        //                               ),
        //                             ),
        //                             Container(
        //                               width: 180,
        //                               child: dropdown_widget_small(
        //                                 labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
        //                                 hintText: "প্রতিষ্ঠানের ধরণ নির্বাচন করুন",
        //                                 initialValue: '',
        //                                 iconData: Icons.phone_android,
        //                                 data: controller.allInstype.value.institute__type_list?.map((item) => item.name!).toList(),
        //                                 onChanged: (input) {
        //                                   for (var item in controller.allInstype.value.institute__type_list!) {
        //                                     if (item.name == input) {
        //                                       controller.instituteTypeId.value = item.id!.toString();
        //                                       // controller.inspectionData.value.institute_type = item.id;
        //
        //                                     }
        //                                   }
        //                                   //controller.getLocationData();
        //                                   //print('union_ id: ${controller.victimUnion.value}');
        //                                   //controller.getInstitute();
        //                                   controller.placeLoaded.value = false;
        //                                   //controller.getInsPectionListType();
        //                                 },
        //                                 isFirst: true,
        //                                 isLast: false,
        //                               ),
        //                             ),
        //
        //                           ],
        //                         ),
        //
        //                         dropdown_widget_small(
        //                           labelText: "শিক্ষা প্রতিষ্ঠানের নাম",
        //                           hintText: "শিক্ষা প্রতিষ্ঠানের নাম নির্বাচন করুন",
        //                           initialValue: '',
        //                           iconData: Icons.phone_android,
        //                           data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
        //                           onChanged: (input) {
        //
        //                             for (var item in controller.instituteData.value.institute_list!) {
        //                               if (item.name == input) {
        //                                 controller.instituteID.value = item.id!.toString();
        //                                 //controller.inspectionData.value.institute_id = item.id;
        //                               }
        //                             }
        //
        //                             controller.placeLoaded.value = false;
        //                             //controller.getInsPectionListInstituteId();
        //
        //                             // for (var item in controller.allStudentData.value.students!) {
        //                             //   if (item.thana_id == controller.instituteUpazila.value && item.institute_type_id == controller.instituteTypeId) {
        //                             //     controller.totalStudent.value = item.total! as int;
        //                             //     controller.totalFemaleStudent.value = item.total_girls! as int;
        //                             //   }
        //                             // }
        //
        //                             //controller.totalBoyStudent.value = controller.totalStudent.value - controller.totalFemaleStudent.value ;
        //
        //                             // controller.getLocationData();
        //                             // print('union_ id: ${controller.victimUnion.value}');
        //                           },
        //                           isFirst: true,
        //                           isLast: false,
        //                         ),
        //
        //                         SizedBox(
        //                           height: 20.0,
        //                         ),
        //
        //                         Text("দূরত্ব (কি মি) : ${controller.distance.value} ",
        //                           style: TextStyle(fontSize: 15),
        //                         ),
        //                         SizedBox(
        //                           height: 5.0,
        //                         ),
        //                         Text("দূরত্ব (মাইল) : ${controller.distance.value} ",
        //                           style: TextStyle(fontSize: 15),
        //                         ),
        //
        //                         SizedBox(
        //                           height: 20.0,
        //                         ),
        //                       ],
        //                     ),
        //
        //
        //
        //
        //                   ),
        //
        //                 ],
        //               ),
        //             ),
        //           ),
        //
        //         ],
        //       ),
        //     ],
        //
        //   );
        // }else {
        //   return Center(child: CircularProgressIndicator());
        // }

      })

    );
  }
}
