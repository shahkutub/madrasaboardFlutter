import 'dart:io';
import 'package:brac_arna/common/ui.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../global_widgets/dropdown_widget_small.dart';
import '../controllers/institute_search_controller.dart';

class general_search_view extends GetView<InstituteSearchController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    Get.find<InstituteSearchController>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(60,55),
          child:  AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              centerTitle: true,
              title: Text('অনুসন্ধান')
          ),
        ),
        body: Obx(() {
          return Column(

            children: [
              SizedBox(
                height: 10,
              ),

              Row(
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
                          controller.districtName.value = '';
                          controller.upzilaName.value = '';
                           controller.victimDivisionName.value =input;
                          for (var item in controller.allDivDisTana.value.division_list!) {
                            if (item.name == input) {
                              controller.victimDivision.value = item.id.toString();
                              //controller.districtList.add(item);
                            }
                          }
                          controller.victimDistrict.value = "";
                          controller.instituteUpazila.value = "";

                         // controller.fetchJoke();
                          controller.placeLoaded.value = false;
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


                          //controller.thanaList.clear();
                          controller.instituteSumary();
                          controller.getInstitute();
                          controller.hintextZela.value = 'জেলা নির্বাচন করুন';
                          controller.hintextThana.value = 'উপজেলা নির্বাচন করুন';
                          print(controller.hintextZela.value);

                          //print('district: ${controller.districtList[0].name}');
                        },
                        isFirst: true,
                        isLast: false,
                      ),
                    ),


                 Obx(() {
                   return Container(
                     width: 180,
                     child: dropdown_widget_small(
                       labelText: "জেলা",
                        hintText: controller.hintextZela.value,
                        //initialValue: controller.hintextZela.value,
                       // errorText: controller.hintextZela.value,
                       //data: controller.allDivDisTana!.value.district_list!.map((item) => item.name!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
                       data: controller.districtList?.map((item) => item.name!).toList(),


                       iconData: Icons.phone_android,
                       onChanged: (input) {
                         controller.districtName.value = input;
                         controller.upzilaName.value = '';
                         for (var item in controller.allDivDisTana.value.district_list!) {

                           if (item.name == input) {
                             controller.victimDistrict.value = item.id!.toString();
                             //controller.inspectionData.value.district_id = item.id;
                           }
                         }
                         controller.instituteUpazila.value = "";
                         controller.placeLoaded.value = false;
                         controller.thanaList.clear();
                         for (var itemd in controller.allDivDisTana.value.thana_list!) {
                           //print('divisionId: ${controller.victimDivision.value}');
                           if (itemd.district_id.toString() == controller.victimDistrict.value.toString().trim()) {
                             print('districtIddd: ${controller.victimDivision.value}');
                             //controller.victimDivision.value = item.id.toString();
                             controller.thanaList.add(itemd);

                           }
                         }
                         // controller.getInsPectionListDistrictd();
                         // controller.getLocationData();
                         controller.instituteSumary();
                         controller.getInstitute();
                         print('district: ${controller.victimDistrict.value}');
                       },
                       isFirst: true,
                       isLast: false,
                     ),
                   );
                 }),



                  ],
                ),



              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                    width: 180,
                    child: dropdown_widget_small(
                      labelText: "উপজেলা",
                      hintText: controller.hintextThana.value,
                      initialValue: '',
                      iconData: Icons.phone_android,
                      data: controller.thanaList?.map((item) => item.name!).toList(),
                      onChanged: (input) {
                        controller.upzilaName.value = input;
                        for (var item in controller.thanaList) {
                          if (item.name == input) {
                            controller.instituteUpazila.value = item.id!.toString();
                            //controller.inspectionData.value.thana_id = item.id;
                          }
                        }
                        // controller.getLocationData();
                        print('upazila: ${controller.instituteUpazila.value}');
                        controller.placeLoaded.value = false;
                       // controller.getInsPectionListThana();
                        controller.instituteSumary();
                        controller.getInstitute();
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
                        controller.placeLoaded.value = false;
                       // controller.getInsPectionListType();
                        controller.instituteSumary();
                        controller.getInstitute();
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
                      print('insID:'+controller.instituteID.value);
                      //controller.inspectionData.value.institute_id = item.id;
                    }
                  }

                  controller.placeLoaded.value = false;
                  controller.instituteSumary();

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
                height: 10.0,
              ),


              Obx(() {
                // Get.put(ProvidedDataListController()).count.value++;
                if(controller.placeLoaded.isTrue){
                  return Expanded(

                    child:ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: Get.size.width,
                            decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Stack(
                                  children: [

                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'অনুসন্ধান সারসংক্ষেপ',
                                        style: TextStyle(fontSize: 20,color: Colors.teal),
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: (){
                                          FlutterShare.shareFile(
                                            title: 'TMED app institute search report pdf',
                                            text: 'Report pdf',
                                            //text: 'Please click on attach link to show & download pdf',
                                            filePath: controller.searchPdfPath.value,
                                            //fileType: '*/*'
                                            //chooserTitle: 'Please click on attach link to show & download pdf'
                                          );
                                        },
                                        child: Container(
                                            width: 100,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.green
                                            ),
                                            child: Text('Share PDF',style: TextStyle(color: Colors.white),)
                                        ),
                                      )

                                    ),



                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('বিভাগ: '+controller.victimDivisionName.value),
                                    Text('  জেলা: '+controller.districtName.value),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('  উপজেলা: '+controller.upzilaName.value),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(70),
                                      1: FlexColumnWidth(30)
                                    },
                                    children: [
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মোট এমপিওভুক্ত শিক্ষা প্রতিষ্ঠানের সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'এমপিওভুক্ত শিক্ষা প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('no_electricity');
                                                Get.toNamed(Routes.INSTITUTE_LIST);

                                                // if(controller.instituteListSummaryBased.value.api_info!.length>0){
                                                //   //displayDialog(context, 'এমপিওভুক্ত শিক্ষা প্রতিষ্ঠান');
                                                //   //showMaterialDialog(context, 'এমপিওভুক্ত শিক্ষা প্রতিষ্ঠান');
                                                // }
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.total_mpo.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            ),

                                          ]),
                                      TableRow(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মোট স্বীকৃতিপ্রাপ্ত শিক্ষা প্রতিষ্ঠানের সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'এমপিওভুক্ত শিক্ষা প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('no_electricity');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.total_recognized.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            )

                                          ]),
                                      TableRow(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মাল্টিমিডিয়া ক্লাসরুমের সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'এমপিওভুক্ত শিক্ষা প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('no_electricity');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.total_multimedia_class_rooms.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            )

                                          ]),
                                      TableRow(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('শেখ রাসেল ডিজিটাল ল্যাব এর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'এমপিওভুক্ত শিক্ষা প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('no_electricity');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.total_digital_lab.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            )

                                          ]),
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('ইন্টারনেট আছে এর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'ইন্টারনেট আছে শিক্ষা প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('yes_internet');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child:Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.total_internet_facility.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            )

                                          ]),

                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('ইন্টারনেট নাই এর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'ইন্টারনেট নাই প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('no_internet');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.no_internet.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            )

                                          ]),

                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('ইলেক্ট্রিসিটি আছে এর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'ইলেক্ট্রিসিটি আছে প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('yes_electricity');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.total_electricity_facility.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )

                                            )

                                          ]),

                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('ইলেক্ট্রিসিটি নাই এর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                controller.placeLoaded.value = false;
                                                controller.instituteListTitle.value = 'ইলেক্ট্রিসিটি নাই প্রতিষ্ঠান';
                                                controller.instituteListSumaryBased('no_electricity');
                                                Get.toNamed(Routes.INSTITUTE_LIST);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                                child: Text(controller.instituteSummary.value.api_info!.no_electricity.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              )
                                            )

                                          ]),


                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('শিক্ষক-শিক্ষিকার সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                              child: Text(controller.instituteSummary.value.api_info!.total_teacher.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            )
                                          ]),
                                      TableRow(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মোট শিক্ষিকার সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                              child: Text(controller.instituteSummary.value.api_info!.total_female_teacher.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            )
                                          ]),

                                      TableRow(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মোট ছাত্র-ছাত্রীর সংখ্যা ',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                              child: Text(controller.instituteSummary.value.api_info!.total_students.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            )
                                          ]),
                                      TableRow(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child: Text('মোট ছাত্রীর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                              child: Text(controller.instituteSummary.value.api_info!.total_girls_students.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            )
                                          ]),
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মোট পরীক্ষার্থীর সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                              child: Text(controller.instituteSummary.value.api_info!.total_examinees.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            )
                                          ]),

                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 7.0,right: 5,bottom: 7.0),
                                              child:
                                              Text('মোট পাশের সংখ্যা',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5,top: 15.0,right: 5,bottom: 7.0),
                                              child: Text(controller.instituteSummary.value.api_info!.total_passed.toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ]),



                                    ],
                                    border: TableBorder.all(width: 1, color: Colors.black),
                                  ),
                                ),
                    // SfPdfViewer.file(
                    //   File(controller.searchPdfPath.value),
                    // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                    // child: SfPdfViewer.file(
                    //   File('storage/emulated/0/Download/gis_succinctly.pdf'),
                    // ),


                   // primary: true,

                    // SingleChildScrollView(
                    // scrollDirection: Axis.vertical,
                    //
                   //   child: ListView(
                   //    children: [
                   //
                   //      Container(
                   //        margin: EdgeInsets.all(5),
                   // // Obx(() => )
                   //  child: DataTable(
                   //          columnSpacing: 35,
                   //          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                   //          dataRowHeight: _size.height * .1,
                   //          headingRowHeight: 0,
                   //          columns: [
                   //
                   //            DataColumn(
                   //              label: Center(
                   //                child: Text(
                   //                  'শিক্ষা প্রতিষ্ঠানের নাম',
                   //                  textAlign: TextAlign.center,
                   //                  style: TextStyle(
                   //                    color: Colors.white,
                   //                  ),
                   //                ),
                   //              ),
                   //            ),
                   //            // DataColumn(
                   //            //   label: Center(
                   //            //     child: Text(
                   //            //       'ঠিকানা',
                   //            //       textAlign: TextAlign.center,
                   //            //       style: TextStyle(
                   //            //         color: Colors.white,
                   //            //       ),
                   //            //     ),
                   //            //   ),
                   //            // ),
                   //            DataColumn(
                   //              label: Center(
                   //                child: Text(
                   //                  'একশন',
                   //                  textAlign: TextAlign.center,
                   //                  style: TextStyle(
                   //                    color: Colors.white,
                   //                  ),
                   //                ),
                   //              ),
                   //            ),
                   //
                   //            // DataColumn(
                   //            //   label: Center(
                   //            //     child: Text(
                   //            //       'মন্তব্য',
                   //            //       textAlign: TextAlign.center,
                   //            //       style: TextStyle(
                   //            //         color: Colors.white,
                   //            //       ),
                   //            //     ),
                   //            //   ),
                   //            // ),
                   //          ],
                   //
                   //      rows: controller.instituteData.value.institute_list!
                   //              .map(
                   //                (data) => DataRow(
                   //
                   //              cells: [
                   //
                   //                DataCell(
                   //                    Text(
                   //                      data.name.toString()
                   //                      //data.name.toString()+"\n"+ controller.instituteUpazila.value+", "+ controller.victimDistrict.value+", "+ data.division_name!
                   //                      ,
                   //                      // +"\n পরিদর্শন তারিখঃ "+ data.updated_at!,
                   //                      maxLines: 5,
                   //                      style: TextStyle(
                   //                          color: Colors.black,
                   //                          backgroundColor: Colors.white
                   //                      ),
                   //                    ),
                   //
                   //                ),
                   //                // DataCell(
                   //                //   Text(
                   //                //     data.thana_name!,
                   //                //     maxLines: 5,
                   //                //     style: TextStyle(
                   //                //       color: Colors.amber,
                   //                //     ),
                   //                //   ),
                   //                //     onTap: (){
                   //                //       controller.launchURL(data.details_url!);
                   //                //     }
                   //                // ),
                   //                // DataCell(Text(
                   //                //   data.updated_at!,
                   //                //   maxLines: 5,
                   //                //   style: TextStyle(
                   //                //     color: Colors.black,
                   //                //   ),
                   //                // ),
                   //                //     onTap: (){
                   //                //       controller.launchURL(data.details_url!);
                   //                //     }
                   //                // ),
                   //
                   //                DataCell(
                   //                    Icon(
                   //                      Icons.picture_as_pdf,
                   //                      color: Colors.green,
                   //                      size: 30.0,
                   //                    ),
                   //                    // onTap: (){
                   //                    //   controller.launchURL(data.details_url!);
                   //                    // }
                   //                    onTap: (){
                   //                    //  controller.pdfUrl.value = data.details_url!;
                   //                     // print('pdfUrl : ${controller.pdfUrl.value}');
                   //                      //controller.launchURL(data.details_url!);
                   //                     // Get.toNamed(Routes.SINGLE_INSPECTION_VIEW_PDF);
                   //                    }
                   //                ),
                   //
                   //                // DataCell(Text(
                   //                //   data.comments.toString(),
                   //                //   maxLines: 5,
                   //                //   style: TextStyle(
                   //                //     color: Colors.black,
                   //                //   ),
                   //                // ),
                   //                //     onTap: (){
                   //                //       controller.launchURL(data.details_url!);
                   //                //     }
                   //                // ),
                   //              ],
                   //
                   //              // onSelectChanged: (value) {
                   //              //   // controller.inspectListPos.value = data.id!;
                   //              //   // Get.toNamed(Routes.SINGLE_INSPECTION_VIEW);
                   //              //
                   //              //
                   //              // }
                   //
                   //            ),
                   //          ).toList(),
                   //        ),
                   //      ),
                   //
                   //
                   //    ],
                   //  ),



                  );
                }else {
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }

              })
            ],
          );
        })

    );
  }

  displayDialog(BuildContext context,String title) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,

      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.white.withOpacity(0),
      //transitionDuration: const Duration(milliseconds: 200),

      //transitionDuration: Duration(milliseconds: 2000),
      // transitionBuilder: (context, animation, secondaryAnimation, child) {
      //   return FadeTransition(
      //     opacity: animation,
      //     child: ScaleTransition(
      //       scale: animation,
      //       child: child,
      //     ),
      //   );
      // },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: Column(
                children:<Widget> [
                  Align(
                    alignment: Alignment.topRight,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("DISMISS",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ),

                  Align(
                      alignment: Alignment.center,
                      child:Column(
                        children: [
                          Container(
                            height: 40.0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: Get.width,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(color: Colors.black)
                                      // ),
                                      child: Text(
                                        title,
                                        style: TextStyle(fontSize: 20,color: Colors.green),
                                      )),
                                ),

                                // Container(
                                //     padding: EdgeInsets.all(4.0),
                                //     width: 100.0,
                                //     child: Text(
                                //       "",
                                //       style: TextStyle(fontSize: 18),
                                //     )),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.instituteListSummaryBased.value.api_info!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [

                              // Expanded(
                              //   child:
                              Container(
                                  margin: EdgeInsets.all(10.0),
                                  //width: MediaQuery.of(context).size.width -20,
                                  child: Text(
                                    controller.instituteListSummaryBased.value.api_info![index].name.toString(),
                                    style: TextStyle(fontSize: 12,color: Colors.black),
                                    textAlign: TextAlign.left,
                                  )),
                              //),
                              Divider(
                                thickness: 1,
                                color: Colors.red,
                              )


                              // Container(
                              //     padding: EdgeInsets.all(4.0),
                              //     width: 200.0,
                              //     child: Text(
                              //       "Institution Name",
                              //       style: TextStyle(fontSize: 18),
                              //     )),
                              // Container(
                              //     padding: EdgeInsets.all(4.0),
                              //     width: 100.0,
                              //     child: Text(
                              //       "",
                              //       style: TextStyle(fontSize: 18),
                              //     )),
                            ],
                          );
                        }
                    ),)

                  ),

                ],
            ),
          ),
        );
      },
    );
  }

  showMaterialDialog(BuildContext context,String title) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(

           // title: Text('Material Dialog'),
            child: Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: Column(
                children:<Widget> [
                  Align(
                      alignment: Alignment.topRight,
                      child:ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("DISMISS",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                  ),

                  Align(
                      alignment: Alignment.center,
                      child:Column(
                        children: [
                          Container(
                            height: 40.0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: Get.width,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(color: Colors.black)
                                      // ),
                                      child: Text(
                                        title,
                                        style: TextStyle(fontSize: 20,color: Colors.green),
                                      )),
                                ),

                                // Container(
                                //     padding: EdgeInsets.all(4.0),
                                //     width: 100.0,
                                //     child: Text(
                                //       "",
                                //       style: TextStyle(fontSize: 18),
                                //     )),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: controller.instituteListSummaryBased.value.api_info!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [

                              // Expanded(
                              //   child:
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    //width: MediaQuery.of(context).size.width -20,
                                    child: Text(
                                      controller.instituteListSummaryBased.value.api_info![index].name.toString(),
                                      style: TextStyle(fontSize: 12,color: Colors.black),
                                    )),
                              //),
                              Divider(
                                thickness: 1,
                                color: Colors.red,
                              )


                              // Container(
                              //     padding: EdgeInsets.all(4.0),
                              //     width: 200.0,
                              //     child: Text(
                              //       "Institution Name",
                              //       style: TextStyle(fontSize: 18),
                              //     )),
                              // Container(
                              //     padding: EdgeInsets.all(4.0),
                              //     width: 100.0,
                              //     child: Text(
                              //       "",
                              //       style: TextStyle(fontSize: 18),
                              //     )),
                            ],
                          );
                        }
                    ),
                  ),

                ],

              ),
            ),
            // actions: <Widget>[
            //   TextButton(
            //       onPressed: () {
            //        // _dismissDialog();
            //       },
            //       child: Text('Close')),
            //   TextButton(
            //     onPressed: () {
            //       print('HelloWorld!');
            //       //_dismissDialog();
            //     },
            //     child: Text('HelloWorld!'),
            //   )
            // ],
          );
        });
  }

}

//admin@gmail.com