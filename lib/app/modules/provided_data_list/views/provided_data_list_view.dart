import 'package:brac_arna/app/modules/global_widgets/cliper.dart';
import 'package:brac_arna/app/modules/home/controllers/home_controller.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:brac_arna/common/app_constant.dart';
import 'package:brac_arna/common/custom_date_range_picker.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../global_widgets/dropdown_widget.dart';
import '../../global_widgets/dropdown_widget_small.dart';
import '../controllers/provided_data_list_controller.dart';

class ProvidedDataListView extends GetView<ProvidedDataListController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {

    DateTime? startDate;
    DateTime? endDate;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(60,55),
          child:  AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              centerTitle: true,
              title: Text('পরিদর্শন তালিকা')
          ),
        ),
        body: Obx(() {
          return Column(
           // primary: true,
            children: [

              // dropdown_widget_small(
              //   labelText: "Division",
              //   hintText: "Select Division",
              //   //data: ,
              //
              // ),

              SizedBox(
                height: 10,
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
                          controller.hintTextDistrict.value = "জেলা নির্বাচন করুন";
                          controller.hintTextUpojela.value = "উপজেলা নির্বাচন করুন";
                          // controller.victimDivisionName.value =input;
                          for (var item in controller.allDivDisTana.value.division_list!) {
                            if (item.name == input) {
                              controller.victimDivision.value = item.id.toString();
                              //controller.districtList.add(item);
                            }
                          }
                         // controller.fetchJoke();
                          controller.placeLoaded.value = false;
                          controller.getInsPectionListDivision();

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
                       // hintText: "জেলা নির্বাচন করুন",
                        hintText: controller.hintTextDistrict.value,
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

                          controller.hintTextUpojela.value = "উপজেলা নির্বাচন করুন";

                          controller.hintTextDistrict.value = input.toString();

                          for (var item in controller.allDivDisTana.value.district_list!) {
                            if (item.name == input) {
                              controller.victimDistrict.value = item.id!.toString();
                              //controller.inspectionData.value.district_id = item.id;
                            }
                          }
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
                          controller.getInsPectionListDistrictd();
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
                      //hintText: "উপজেলা নির্বাচন করুন",
                      hintText: controller.hintTextUpojela.value,
                      initialValue: '',
                      iconData: Icons.phone_android,
                      data: controller.thanaList?.map((item) => item.name!).toList(),
                      onChanged: (input) {

                        controller.hintTextUpojela.value = input.toString();

                        for (var item in controller.thanaList) {
                          if (item.name == input) {
                            controller.instituteUpazila.value = item.id!.toString();
                            //controller.inspectionData.value.thana_id = item.id;
                          }
                        }
                        // controller.getLocationData();
                        print('upazila: ${controller.instituteUpazila.value}');
                        controller.placeLoaded.value = false;
                        controller.getInsPectionListThana();

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
                        controller.getInstitute();
                        controller.placeLoaded.value = false;
                        controller.getInsPectionListType();
                      },
                      isFirst: true,
                      isLast: false,
                    ),
                  ),

                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 0,left: 20,right: 20),
                child: dropdown_widget_small(
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

                    controller.placeLoaded.value = false;
                    controller.getInsPectionListInstituteId();

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
              ),


              // Container(
              //   margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              //   child: Row(
              //     children: [
              //       Container(width: 180,child: Text('From date')),
              //       SizedBox(width: 10,),
              //       Container(width: 180,child: Text('To date'))
              //     ],
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(top:10,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                      children: [
                        Text("তারিখ হইতে",style: TextStyle(color: Colors.teal),),
                        InkWell(
                            onTap: (){
                              controller.chooseDate('from');

                              // showCustomDateRangePicker(
                              //   context,
                              //   dismissible: true,
                              //   minimumDate: DateTime.now(),
                              //   maximumDate: DateTime.now().add(const Duration(days: 30)),
                              //   endDate: endDate,
                              //   startDate: startDate,
                              //   onApplyClick: (start, end) {
                              //    // setState(() {
                              //       endDate = end;
                              //       startDate = start;
                              //     //});
                              //   },
                              //   onCancelClick: () {
                              //     //setState(() {
                              //       endDate = null;
                              //       startDate = null;
                              //     //});
                              //   },
                              // );
                            },
                            child:Container(
                              width: Get.width/2.6,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),

                              ),
                              child: Text(controller.fromDate.value.toString(),style: TextStyle(fontSize: 15),

                              ),
                            )

                        ),
                      ],
                    ),

                    flex: 1,),


                    Flexible(child: Column(
                      children: [
                        Text("তারিখ পর্যন্ত",style: TextStyle(color: Colors.teal),),
                        InkWell(
                            onTap: (){
                              controller.chooseDate('to');
                            },
                            child:Container(
                              width: Get.width/2.6,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),

                              ),
                              child: Text(controller.toDate.value.toString(),style: TextStyle(fontSize: 15),),
                            )

                        ),
                      ],
                    ),flex: 1,)

                  ],
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 0,left: 20,right: 20),
                child: dropdown_widget_small(
                  labelText: "পরিদর্শকের নাম",
                  hintText: "পরিদর্শকের নাম নির্বাচন করুন",
                  initialValue: '',
                  iconData: Icons.phone_android,
                  data: controller.insPectorListRespponse.value.inspectors?.map((item) => item.name!).toList(),
                  onChanged: (input) {

                    for (var item in controller.insPectorListRespponse.value.inspectors!) {
                      if (item.name == input) {
                        controller.inspectorID.value = item.id!.toString();
                        //controller.inspectionData.value.institute_id = item.id;
                      }
                    }
                    controller.placeLoaded.value = false;
                    controller.getInsPectionListByInspectorId();


                  },
                  isFirst: true,
                  isLast: false,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),


              Obx(() {
                // Get.put(ProvidedDataListController()).count.value++;
                if(controller.placeLoaded.isTrue){
                  return Expanded(


                    child: ListView(
                      children: [

                        Container(
                          margin: EdgeInsets.all(5),
                   // Obx(() => )
                    child: DataTable(
                            columnSpacing: 35,
                            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                            dataRowHeight: _size.height * .2,
                            headingRowHeight: 0,
                            columns: [

                              DataColumn(
                                label: Center(
                                  child: Text(
                                    'শিক্ষা প্রতিষ্ঠানের নাম',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // DataColumn(
                              //   label: Center(
                              //     child: Text(
                              //       'ঠিকানা',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              DataColumn(
                                label: Center(
                                  child: Text(
                                    'একশন',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              // DataColumn(
                              //   label: Center(
                              //     child: Text(
                              //       'মন্তব্য',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                        
                        rows: controller.inspectionListData.value.inspection_list!
                                .map(
                                  (data) => DataRow(

                                cells: [

                                  DataCell(
                                      Text(
                                        data.institution_name.toString()+"\n"+ data.thana_name!+", "+ data.district_name!+", "+ data.division_name!
                                            +"\n পরিদর্শন তারিখঃ "+ controller.dateFomat(data.updated_at!),
                                        // +"\n পরিদর্শন তারিখঃ "+ data.updated_at!,
                                        maxLines: 5,
                                        style: TextStyle(
                                            color: Colors.black,
                                            backgroundColor: Colors.white
                                        ),
                                      ),
                                      onTap: (){
                                        controller.pdfUrl.value = data.details_url!;
                                        print('pdfUrl : ${controller.pdfUrl.value}');
                                        //controller.launchURL(data.details_url!);
                                        Get.toNamed(Routes.SINGLE_INSPECTION_VIEW_PDF);
                                      }
                                  ),
                                  // DataCell(
                                  //   Text(
                                  //     data.thana_name!,
                                  //     maxLines: 5,
                                  //     style: TextStyle(
                                  //       color: Colors.amber,
                                  //     ),
                                  //   ),
                                  //     onTap: (){
                                  //       controller.launchURL(data.details_url!);
                                  //     }
                                  // ),
                                  // DataCell(Text(
                                  //   data.updated_at!,
                                  //   maxLines: 5,
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  //     onTap: (){
                                  //       controller.launchURL(data.details_url!);
                                  //     }
                                  // ),

                                  DataCell(
                                      // Icon(
                                      //   Icons.picture_as_pdf,
                                      //   color: Colors.green,
                                      //   size: 30.0,
                                      // ),
                                      // // onTap: (){
                                      // //   controller.launchURL(data.details_url!);
                                      // // }
                                      // onTap: (){
                                      //   controller.pdfUrl.value = data.details_url!;
                                      //   print('pdfUrl : ${controller.pdfUrl.value}');
                                      //   //controller.launchURL(data.details_url!);
                                      //   Get.toNamed(Routes.SINGLE_INSPECTION_VIEW_PDF);
                                      // }

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.picture_as_pdf,
                                            color: Colors.green,
                                            size: 30.0,
                                          ),
                                          onTap: (){
                                            controller.pdfUrl.value = data.details_url!;
                                            print('pdfUrl : ${controller.pdfUrl.value}');
                                            //controller.launchURL(data.details_url!);
                                            Get.toNamed(Routes.SINGLE_INSPECTION_VIEW_PDF);
                                          }
                                        ),
                                        SizedBox(width: 20,),
                                        InkWell(
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                            size: 30.0,
                                          ),
                                          onTap: (){
                                            AppConstant.inspectionData = data;
                                            //Get.toNamed(Routes.INSPECTION_EDIT);
                                            Get.toNamed(Routes.INFORMATION_FORM);
                                          },
                                        ),
                                      ],
                                    )

                                  ),

                                  // DataCell(Text(
                                  //   data.comments.toString(),
                                  //   maxLines: 5,
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  //     onTap: (){
                                  //       controller.launchURL(data.details_url!);
                                  //     }
                                  // ),
                                ],

                                // onSelectChanged: (value) {
                                //   // controller.inspectListPos.value = data.id!;
                                //   // Get.toNamed(Routes.SINGLE_INSPECTION_VIEW);
                                //
                                //
                                // }

                              ),
                            ).toList(),
                          ),
                        ),


                      ],
                    ),



                  );
                }else {
                  return Center(child: CircularProgressIndicator());
                }

              })
            ],
          );
        })

    );
  }

}

//admin@gmail.com