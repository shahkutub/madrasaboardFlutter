import 'dart:convert';

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

import '../../../services/auth_service.dart';
import '../controllers/information_form_controller.dart';

class InformationFormViewOld extends GetView<InformationFormController> {

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
            title: Text('শিক্ষা প্রতিঠান পরিদর্শন',
              textAlign: TextAlign.left,
            ),

            actions: <Widget>[

            ],
          ),
        ),
        body: Obx(() {
          if (controller.placeLoaded.isTrue) {
            return
              SingleChildScrollView(
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

                            TextFieldWidgetSmall(
                              controller: controller.inspectionDateEditContr.value,
                              labelText: "পরিদর্শনের তারিখ",
                              hintText: "",
                              //initialValue: controller.inspectionDateEditContr.value.text.toString(),
                              onChanged: (input) {
                                controller.inspectionData.value.inspectionDate = input;
                              },
                              keyboardType: TextInputType.datetime,

                            ),
                            // TextFieldWidgetSmall(
                            //   labelText: "পরিদর্শনকারীর নাম ও পদবি",
                            //   hintText: "",
                            //   initialValue: "",
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.inspectorName = input;
                            //   },
                            //   keyboardType: TextInputType.multiline,
                            //
                            // ),

                        Obx(() =>
                            MultipleSelectionDropDownWidget(

                              labelText: "পরিদর্শনকারীর নাম ও পদবি",
                              hintText: "পরিদর্শনকারীর নাম ও পদবি",
                              initialValue: controller.selectedInspectorNameList[0].toString(),
                              selectedValue: controller.selectedInspectorNameList,
                              data: controller.insPectorListRespponse!.value.inspectors?.map((item) => item.name!).toList(),

                              onChanged: (input) {
                                controller.inspectorIdList.clear();
                                // controller.inspectorIdList.value.add(input);

                                for (var inpuItem in input) {
                                  for (var item in controller.insPectorListRespponse!.value.inspectors!) {
                                    if (item.name == inpuItem) {
                                      print('insPectorId: ${item.id}');
                                      controller.inspectorIdList.add(item.id);
                                    }
                                  }
                                }

                                controller.inspectorIdListJson.value = jsonEncode(controller.inspectorIdList);
                                print('IdListjson: ${controller.inspectorIdListJson.value.toString()}');
                                print('IdListLenth: ${controller.inspectorIdList.length}');

                              },
                              iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),
                        ),


                            DropDownWidget(
                              labelText: "বিভাগ",
                              hintText: "বিভাগ নির্বাচন করুন",
                              initialValue: controller.selectedDivname.value,

                              //data: controller.places.value.area!.map((item) => item.divisionName!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
                              data: controller.allDivDisTana!.value.division_list?.map((item) => item.name!).toList(),

                              iconData: Icons.phone_android,
                              onChanged: (input) {

                               // controller.victimDivisionName.value =input;
                                for (var item in controller.allDivDisTana.value.division_list!) {
                                  if (item.name == input) {
                                    //controller.victimDivision.value = item.id.toString();
                                    //controller.districtList.add(item);
                                    controller.inspectionData.value.division_id = item.id;
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
                              initialValue: controller.selectedDistrictName.value.toString(),
                              //data: controller.allDivDisTana!.value.district_list!.map((item) => item.name!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
                              data: controller.districtList?.map((item) => item.name!).toList(),



                              iconData: Icons.phone_android,
                              onChanged: (input) {
                                for (var item in controller.allDivDisTana.value.district_list!) {
                                  if (item.name == input) {
                                    controller.victimDistrict.value = item.id!.toString();
                                    controller.inspectionData.value.district_id = item.id;
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
                              labelText: "থানা",
                              hintText: "থানা নির্বাচন করুন",
                              initialValue: controller.selectedThanaName.value.toString(),
                              iconData: Icons.phone_android,
                              data: controller.thanaList?.map((item) => item.name!).toList(),
                              onChanged: (input) {
                                for (var item in controller.thanaList) {
                                  if (item.name == input) {
                                    controller.instituteUpazila.value = item.id!.toString();
                                    controller.inspectionData.value.thana_id = item.id;
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
                                    controller.inspectionData.value.institute_type = item.id;

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
                              initialValue: controller.selectedInstituteName.value,
                              iconData: Icons.phone_android,
                              data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
                              onChanged: (input) {

                                for (var item in controller.instituteData.value.institute_list!) {
                                  if (item.name == input) {
                                    controller.eiinNumber.value = item.eiin!;
                                    controller.inspectionData.value.institute_id = item.id;
                                  }
                                }

                              },

                            ),

                            TextFieldWidgetSmall(
                              controller: controller.recogniseDateEditContr.value,
                              labelText: "স্বীকৃতি প্রাপ্তির তারিখ",
                              hintText: "",
                              //initialValue: "",
                              onChanged: (input) {
                                controller.inspectionData.value.recognise_date = input;
                              },
                              keyboardType: TextInputType.datetime,

                            ),

                            TextFieldWidgetSmall(
                              controller: controller.mpoDateEditContr.value,
                              labelText: "এমপিওভুক্তির তারিখ",
                              hintText: "",
                              //initialValue: "",
                              onChanged: (input) {
                                controller.inspectionData.value.mpo_date = input;

                              },
                              keyboardType: TextInputType.datetime,

                            ),

                            // TextFieldWidgetSmall(
                            //   labelText: "প্রতিষ্ঠানের ই আই এন (EIN)",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.eiinNumber = input;
                            //   },
                            //
                            // ),

                            // TextFieldWidgetSmall(
                            //   labelText: "পরিদর্শনকারী কর্মকর্তার নাম",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     //controller.inspectorName.value = input;
                            //     controller.inspectionData.value.inspectorName = input;
                            //   },
                            //
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "পরিদর্শনকারী কর্মকর্তার পদবি",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.inspectorPost = input;
                            //   },
                            //
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "পরিদর্শনকারী কর্মকর্তার মোবাইল",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.inspectorMobile = input;
                            //   },
                            //   keyboardType:TextInputType.phone,
                            //
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "পরিদর্শনকারী কর্মকর্তার ইমেইল",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.inspectorEmail = input;
                            //   },
                            //   keyboardType: TextInputType.emailAddress,
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "পরিদর্শনের তারিখ",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.inspectionDate = input;
                            //   },
                            //
                            // ),


                            TextFieldWidgetSmall(
                              controller: controller.headTeacherEditContr.value,
                              labelText: "প্রতিষ্ঠান প্রধানের নাম",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                controller.inspectionData.value.headmaster_name = input;
                              },

                            ),
                            TextFieldWidgetSmall(
                              controller: controller.headTeacherMobileEditContr.value,
                              labelText: "প্রতিষ্ঠান প্রধানের মোবাইল নম্বর",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                //controller.instiruteHeadMobile = input;
                                controller.inspectionData.value.headmaster_mobile_no = input;
                              },
                              keyboardType: TextInputType.phone,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            // TextFieldWidgetSmall(
                            //   labelText: "প্রতিষ্ঠান প্রধানের পদবি",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     //controller.instiruteHeadMobile = input;
                            //     controller.inspectionData.value.headmaster_post = input;
                            //   },
                            //   keyboardType: TextInputType.text,
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   //iconData: Icons.phone_android,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "প্রতিষ্ঠানের মোট অনুমোদিত পদ",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     //controller.instiruteHeadMobile = input;
                            //     controller.inspectionData.value.institute_permited_post = input;
                            //   },
                            //   keyboardType: TextInputType.number,
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   //iconData: Icons.phone_android,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),



                            TextFieldWidgetSmall(
                              controller: controller.teacherCountEditContr.value,
                              labelText: "কর্মরত মোট শিক্ষক সংখ্যা",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                //controller.teacherCount = input;
                                controller.inspectionData.value.total_teachers = input;
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                             // iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              controller: controller.womanteacherCountEditContr.value,
                              labelText: "কর্মরত মোট শিক্ষিকার সংখ্যা",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                //controller.femaleteacherCount = input;
                                controller.inspectionData.value.total_women_teachers = input;

                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),


                            TextFieldWidgetSmall(
                              controller: controller.studentCountEditContr.value,
                              labelText: "মোট ছাত্র-ছাত্রীর সংখ্যা",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.number,
                              onChanged: (input) {
                                //controller.totalStudent.value = input as int;
                                controller.inspectionData.value.total_students = input;
                                print('total_students: ${controller.inspectionData.value.total_students}');

                              },

                            ),

                            TextFieldWidgetSmall(
                              controller: controller.girlstudentCountEditContr.value,
                              labelText: "মোট ছাত্রীর সংখ্যা",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                // controller.totalFemaleStudent.value = input as int;
                                controller.inspectionData.value.total_girls_students = input;
                                print('total_girls_students: ${controller.inspectionData.value.total_girls_students}');
                              },
                              keyboardType: TextInputType.number,

                            ),

                            TextFieldWidgetSmall(
                              controller: controller.examineeCountEditContr.value,
                              labelText: "মোট পরীক্ষার্থীর সংখ্যা",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                // controller.totalFemaleStudent.value = input as int;
                                controller.inspectionData.value.total_examine = input;
                                print('total_examine: ${controller.inspectionData.value.total_examine}');
                              },
                              keyboardType: TextInputType.number,

                            ),

                            TextFieldWidgetSmall(
                              controller: controller.passedCountEditContr.value,
                              labelText: "মোট পাশের সংখ্যা ",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                // controller.totalFemaleStudent.value = input as int;
                                controller.inspectionData.value.total_passed = input;
                                print('total_passed: ${controller.inspectionData.value.total_passed}');
                              },
                              keyboardType: TextInputType.number,

                            ),

                            // TextFieldWidgetSmall(
                            //   labelText: "সংযুক্ত শিক্ষক সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     //controller.femaleteacherCount = input;
                            //     controller.inspectionData.value.total_songjukto_teachers = input;
                            //
                            //   },
                            //   keyboardType: TextInputType.number,
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   //iconData: Icons.phone_android,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            //
                            // TextFieldWidgetSmall(
                            //   labelText: "শূন্য পদ সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.empty_post = input;
                            //
                            //   },
                            //   keyboardType: TextInputType.number,
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   //iconData: Icons.phone_android,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "উপস্থিত শিক্ষক/কর্মচারীর সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.present_teacher = input;
                            //
                            //   },
                            //   keyboardType: TextInputType.number,
                            //   // limit: 255,
                            //   // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                            //   //iconData: Icons.phone_android,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            //
                            // TextFieldWidgetSmall(
                            //   labelText: "অনুপস্থিত শিক্ষক/কর্মচারীর সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.abcent_teacher = input;
                            //
                            //   },
                            //   keyboardType: TextInputType.number,
                            //
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            //
                            // DropDownWidgetMenu(
                            //   labelText: "শিক্ষক/শিক্ষিকা ফর্মাল পোশাকে আছে কি না?",
                            //   hintText: "শিক্ষক/শিক্ষিকা ফর্মাল পোশাকে আছে কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.isFormalDress = 1;
                            //     }else{
                            //       controller.inspectionData.value.isFormalDress = 0;
                            //     }
                            //
                            //
                            //   },
                            //   //iconData: Icons.merge_type,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),


                            DropDownWidgetMenu(
                              labelText: "শিক্ষকদের আইসিটি প্রশিক্ষণ আছে কি না?",
                              hintText: "শিক্ষকদের আইসিটি প্রশিক্ষণ আছে কি না?",
                              initialValue: controller.selectedIctTraining.value,
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {

                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.isIctTraining = 1;
                                }else{
                                  controller.inspectionData.value.isIctTraining = 0;
                                }
                                //controller.inspectionData.value.teacher_training = controller.IsTecherTraining.value.toString();

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            
                            DropDownWidgetMenu(
                              labelText: "শিক্ষকদের অন্যান্য প্রশিক্ষণ আছে কি না?",
                              hintText: "শিক্ষকদের অন্যান্য প্রশিক্ষণ আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //  controller.IsTecherTraining.value = input!;


                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.isOtherTraining = 1;
                                }else{
                                  controller.inspectionData.value.isOtherTraining = 0;
                                }
                                //controller.inspectionData.value.teacher_training = controller.IsTecherTraining.value.toString();


                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),
                            // TextFieldWidgetSmall(
                            //   labelText: "বিশেষ চাহিদা সম্পন্ন শিক্ষার্থী থাকলে তাদের সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //    // controller.totalFemaleStudent.value = input as int;
                            //     controller.inspectionData.value.special_needs_students = input;
                            //     print('total_girls_students: ${controller.inspectionData.value.special_needs_students}');
                            //   },
                            //   keyboardType: TextInputType.number,
                            //
                            // ),

                            // TextFieldWidgetSmall(
                            //   labelText: "বৃত্তি প্রাপ্ত শিক্ষার্থীর সংখ্যা",
                            //   hintText: "",
                            //   initialValue: '',
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.cholarship_students = input;
                            //     print('total_girls_students: ${controller.inspectionData.value.cholarship_students}');
                            //   },
                            //   keyboardType: TextInputType.number,
                            //
                            // ),

                            // Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: Container(
                            //     width: Get.size.width,
                            //     decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //
                            //         Padding(
                            //           padding: const EdgeInsets.all(10.0),
                            //           child: Text(
                            //            // 'মোট পরীক্ষার্থীর সংখ্যা',
                            //             ' পরীক্ষার্থীর সংখ্যা',
                            //             style: TextStyle(fontSize: 20,color: Colors.teal),
                            //           ),
                            //
                            //         ),
                            //
                            //         Padding(
                            //           padding: const EdgeInsets.all(20),
                            //           child: Table(
                            //             columnWidths: const {
                            //               0: FlexColumnWidth(70),
                            //               1: FlexColumnWidth(30)
                            //             },
                            //             children: [
                            //
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('দাখিল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "0",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.dakhilExamine_students = text.toString();
                            //
                            //                           print('dakhilexmineeCount: ${controller.inspectionData.value.dakhilExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('আলিম',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "0",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.alimExamine_students = text.toString();
                            //
                            //                           print('alimExamine_students: ${controller.inspectionData.value.alimExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('ফাজিল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.fazilExamine_students = text.toString();
                            //
                            //                           print('fazilExamine_students: ${controller.inspectionData.value.fazilExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('কামিল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.kamilExamine_students = text.toString();
                            //
                            //                           print('kamilExamine_students: ${controller.inspectionData.value.kamilExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('এস এস সি (ভোক)',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.vokExamine_students = text.toString();
                            //
                            //                           print('vokExamine_students: ${controller.inspectionData.value.vokExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('এএইচ এস সি (ভোক)/এইচ এস সি (বিএমটি)',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.bmetExamine_students = text.toString();
                            //
                            //                           print('bmetExamine_students: ${controller.inspectionData.value.bmetExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('ডিপ্লোমা ইঞ্জিনিয়ারিং ফাইনাল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.deplomaEngExamine_students = text.toString();
                            //
                            //                           print('deplomaEngExamine_students: ${controller.inspectionData.value.deplomaEngExamine_students}');
                            //                         },
                            //
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('শর্ট কোর্স',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.shortExamine_students = text.toString();
                            //
                            //                           print('shortExamine_students: ${controller.inspectionData.value.shortExamine_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //             ],
                            //             border: TableBorder.all(width: 1, color: Colors.black),
                            //           ),
                            //         )
                            //
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            //
                            // Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: Container(
                            //     width: Get.size.width,
                            //     decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //
                            //         Padding(
                            //           padding: const EdgeInsets.all(10.0),
                            //           child: Text(
                            //             //'মোট পাশের সংখ্যা',
                            //             'পাশের সংখ্যা',
                            //             style: TextStyle(fontSize: 20,color: Colors.teal),
                            //           ),
                            //
                            //         ),
                            //
                            //         Padding(
                            //           padding: const EdgeInsets.all(20),
                            //           child: Table(
                            //             columnWidths: const {
                            //               0: FlexColumnWidth(70),
                            //               1: FlexColumnWidth(30)
                            //             },
                            //             children: [
                            //
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('দাখিল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "0",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.dakhilPass_students = text.toString();
                            //
                            //                           print('dakhilPass_students: ${controller.inspectionData.value.dakhilPass_students}');
                            //                         },
                            //
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('আলিম',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.alimPass_students = text.toString();
                            //
                            //                           print('alimPass_students: ${controller.inspectionData.value.alimPass_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('ফাজিল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.fazilPass_students = text.toString();
                            //                           print('fazilPass_students: ${controller.inspectionData.value.fazilPass_students}');
                            //                         },
                            //
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('কামিল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                           onChanged: (text){
                            //                             controller.inspectionData.value.kamilPass_students = text.toString();
                            //                             print('kamilPass_students: ${controller.inspectionData.value.kamilPass_students}');
                            //                           },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('এস এস সি (ভোক)',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.vokPass_students = text.toString();
                            //                           print('vokPass_students: ${controller.inspectionData.value.vokPass_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('এস এস সি (ভোক)/এইচ এস সি (বিএমটি)',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.bmetPass_students = text.toString();
                            //                           print('bmetPass_students: ${controller.inspectionData.value.bmetPass_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('ডিপ্লোমা ইঞ্জিনিয়ারিং ফাইনাল',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.deplomaEngPass_students = text.toString();
                            //                           print('deplomaEngPass_students: ${controller.inspectionData.value.deplomaEngPass_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //               TableRow(
                            //
                            //                   children: [
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                            //                       child:
                            //                       Text('শর্ট কোর্স',
                            //                         //textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.only(left: 10,top: 0.0,right: 5,bottom: 0.0),
                            //                       child: TextField(
                            //                         obscureText: false,
                            //                         decoration: InputDecoration(
                            //                           border: InputBorder.none,
                            //                           // labelText: '60',
                            //                           hintText: "",
                            //                           //hintStyle:
                            //
                            //                         ),
                            //                         onChanged: (text){
                            //                           controller.inspectionData.value.shortPass_students = text.toString();
                            //                           print('shortPass_students: ${controller.inspectionData.value.shortPass_students}');
                            //                         },
                            //                       ),
                            //                     )
                            //                   ]),
                            //             ],
                            //             border: TableBorder.all(width: 1, color: Colors.black),
                            //           ),
                            //         )
                            //
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            DropDownWidgetMenu(
                              labelText: "বিদ্যুৎ সুবিধা",
                              hintText: "বিদ্যুৎ সুবিধা",
                              initialValue: controller.selectedElectricity.value,
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                // controller.IsElectricity.value = input!;
                                // print(controller.IsElectricity);

                                if(input == 'হ্যাঁ'){
                                  controller.IsElectricity.value = 1;
                                }else{
                                  controller.IsElectricity.value = 0;
                                }
                                controller.inspectionData.value.electricity_facility = controller.IsElectricity.value as int;


                              },
                              // iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "ইন্টারনেট সুবিধা",
                              hintText: "ইন্টারনেট সুবিধা",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'হ্যাঁ'){
                                  controller.IsInternet.value = 1;
                                }else{
                                  controller.IsInternet.value = 0;
                                }

                                // print(controller.IsStatePlaintiffCase);
                                controller.inspectionData.value.internet_facility = controller.IsInternet.value as int;

                              },
                              //  iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              controller: controller.multimediaRoomCountEditContr.value,
                              labelText: "মাল্টিমিডিয়া শ্রেণীকক্ষের সংখ্যা ",
                              hintText: "",
                              //initialValue: "",
                              onChanged: (input) {
                                controller.inspectionData.value.total_multimedia_classroom = input;

                              },
                              keyboardType: TextInputType.number,


                            ),


                            TextFieldWidgetSmall(
                              controller: controller.digitalLabCountEditContr.value,
                              labelText: "ডিজিটাল ল্যাব এর সংখ্যা",
                              hintText: "",
                              //initialValue: '',
                              onChanged: (input) {
                                controller.inspectionData.value.total_digital_lab = input;

                              },
                              keyboardType: TextInputType.number,

                            ),


                            // DropDownWidgetMenu(
                            //   labelText: "শেখ রাসেল ল্যাব",
                            //   hintText: "শেখ রাসেল ল্যাব",
                            //   initialValue: 'নাই',
                            //   data: ['আছে', 'নাই'],
                            //   onChanged: (input) {
                            //     if(input == 'নাই'){
                            //       controller.inspectionData.value.isSkrLab = 1;
                            //     }else{
                            //       controller.inspectionData.value.isSkrLab = 0;
                            //     }
                            //
                            //   },
                            //
                            // ),

                            DropDownWidgetMenu(
                              labelText: "অনলাইনে ক্লাস",
                              hintText: "অনলাইনে ক্লাস",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'নাই'){
                                  controller.inspectionData.value.isOnlineClass = 1;
                                }else{
                                  controller.inspectionData.value.isOnlineClass = 0;
                                }
                              },

                            ),


                            // DropDownWidgetMenu(
                            //   labelText: "পরিস্কার পরিচ্ছন্নতা",
                            //   hintText: "পরিস্কার পরিচ্ছন্নতা",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.isCleanness = 0;
                            //     }else{
                            //       controller.inspectionData.value.isCleanness = 1;
                            //     }
                            //   },
                            //   //  iconData: Icons.merge_type,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            //
                            // DropDownWidgetMenu(
                            //   labelText: "প্রতিষ্ঠানের ক্যাচ ম্যান্ট এলাকার হালনাগাদ ম্যাপ আছে কি না?",
                            //   hintText: "প্রতিষ্ঠানের ক্যাচ ম্যান্ট এলাকার হালনাগাদ ম্যাপ আছে কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.isCachmant = 1;
                            //     }else{
                            //       controller.inspectionData.value.isCachmant = 0;
                            //     }
                            //   },
                            //   //  iconData: Icons.merge_type,
                            //   isFirst: true,
                            //   isLast: false,
                            // ),
                            // DropDownWidgetMenu(
                            //   labelText: "রেজিস্টার ও রেকর্ড পত্র সঠিক ভাবে ব্যবহার করা হয় কি না ?",
                            //   hintText: "রেজিস্টার ও রেকর্ড পত্র সঠিক ভাবে ব্যবহার করা হয় কি না ?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     if(input == 'না'){
                            //       controller.inspectionData.value.isRegisok = 0;
                            //     }else{
                            //       controller.inspectionData.value.isRegisok = 1;
                            //     }
                            //   },
                            //
                            // ),
                            // DropDownWidgetMenu(
                            //   labelText: "শিক্ষার্থীদের নিয়ে সাপ্তাহিক ক্রিয়াকলাপ হয় কি না?",
                            //   hintText: "শিক্ষার্থীদের নিয়ে সাপ্তাহিক ক্রিয়াকলাপ হয় কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     if(input == 'না'){
                            //       controller.inspectionData.value.isWeekWork = 0;
                            //     }else{
                            //       controller.inspectionData.value.isWeekWork = 1;
                            //     }
                            //   },
                            //
                            // ),
                            DropDownWidgetMenu(
                              labelText: "প্রাথমিক চিকিৎসার ব্যবস্থা আছে কি না?",
                              hintText: "প্রাথমিক চিকিৎসার ব্যবস্থা আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
                                  controller.inspectionData.value.isPrymariHealth = 0;
                                }else{
                                  controller.inspectionData.value.isPrymariHealth = 1;
                                }
                              },

                            ),
                            DropDownWidgetMenu(
                              labelText: "পরিস্কার পরিচ্ছন্নতা প্রদক্ষেপ আছে কি না ",
                              hintText: "পরিস্কার পরিচ্ছন্নতা প্রদক্ষেপ আছে কি না ",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.isCleanness = 0;
                                }else{
                                  controller.inspectionData.value.isCleanness = 1;
                                }
                              },
                              //  iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "অভিভাবক সমাবেশ হয় কি না?",
                              hintText: "অভিভাবক সমাবেশ হয় কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {

                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },

                            ),

                            // DropDownWidgetMenu(
                            //   labelText: "টয়লেট পরিষ্কার কি না?",
                            //   hintText: "টয়লেট পরিষ্কার কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     //controller.IsInternet.value = input!;
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.toiletClean = "1";
                            //     }else{
                            //       controller.inspectionData.value.toiletClean = "0";
                            //     }
                            //
                            //   },
                            //
                            // ),
                            //
                            // DropDownWidgetMenu(
                            //   labelText: "নিরাপদ পানির ব্যবস্থা আছে কি না?",
                            //   hintText: "নিরাপদ পানির ব্যবস্থা আছে কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     //controller.IsInternet.value = input!;
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.safeWater = "1";
                            //     }else{
                            //       controller.inspectionData.value.safeWater = "0";
                            //     }
                            //
                            //   },
                            //
                            // ),
                            //
                            // DropDownWidgetMenu(
                            //   labelText: "প্রতিষ্টানটি বৃক্ষ/গাছ দ্বারা পরিবেষ্টিত কী?",
                            //   hintText: "প্রতিষ্টানটি বৃক্ষ/গাছ দ্বারা পরিবেষ্টিত কী?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     //controller.IsInternet.value = input!;
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.tree = "1";
                            //     }else{
                            //       controller.inspectionData.value.tree = "0";
                            //     }
                            //
                            //   },
                            //
                            // ),
                            //
                            // DropDownWidgetMenu(
                            //   labelText: "শিক্ষার্থীদের পোশাক পরিচ্ছন্ন কি না?",
                            //   hintText: "শিক্ষার্থীদের পোশাক পরিচ্ছন্ন কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     //controller.IsInternet.value = input!;
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.cleanDress = "1";
                            //     }else{
                            //       controller.inspectionData.value.cleanDress = "0";
                            //     }
                            //
                            //   },
                            //
                            // ),


                             DropDownWidgetMenu(
                              labelText: "মানসিক স্বাস্থ্য কার্যক্রম হয় কি না?",
                              hintText: "মানসিক স্বাস্থ্য কার্যক্রম হয় কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.mentalHealthActivity = "1";
                                }else{
                                  controller.inspectionData.value.mentalHealthActivity = "0";
                                }

                              },

                            ),


                            // TextFieldWidgetSmall(
                            //   labelText: "কোভিড-১৯ টিকা নিয়েছে কতজন শিক্ষার্থী?",
                            //   hintText: "",
                            //   initialValue: '',
                            //   keyboardType: TextInputType.number,
                            //   onChanged: (input) {
                            //     //controller.techerIctTraining = input;
                            //     controller.inspectionData.value.covid19_vaccinated = input;
                            //   },
                            //
                            // ),

                            TextFieldWidgetSmall(
                              controller: controller.weeklyActivityEditContr.value,
                              labelText: "শিক্ষার্থীদের নিয়ে কি কি সাপ্তাহিক ক্রিয়াকলাপ হয়",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                controller.inspectionData.value.week_studuents_activities = input;
                              },

                              isLast: false,
                            ),
                            TextFieldWidgetSmall(
                              controller: controller.softskillEditContr.value,
                              labelText: "ছাত্র-ছাত্রীদের সফট স্কিল /English Language skill বিষয়ে কী ধরনের কার্যক্রম গ্রহণ করাহয়েছে তার বিবরণ",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.soft_skill = input;
                              },

                              isLast: false,
                            ),



                            TextFieldWidgetSmall(
                              controller: controller.cocaricolamActiEditContr.value,
                              labelText: "প্রতিষ্ঠানে কী কী কো-কারিকুলাম কার্যকর রয়েছে",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.cocurricular_activities = input;
                              },

                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              controller: controller.classActivityEditContr.value,
                              labelText: "শ্রেণী কার্যক্রম পর্যবেক্ষণ",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.shreniKarjo = input;
                              },

                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              controller: controller.classUpgradeEditContr.value,
                              labelText: "ক্লাস আপগ্রেডেশন সাজেশন",
                              hintText: "ক্লাস আপগ্রেডেশন সাজেশন ",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                controller.inspectionData.value.upgradationSuggession = input;
                              },

                            ),

                            // DropDownWidgetMenu(
                            //   labelText: "বার্ষিক পাঠ পরিকল্পনা আছে কি না ?",
                            //   hintText: "বার্ষিক পাঠ পরিকল্পনা আছে কি না ?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.yearlyPlan = "1";
                            //     }else{
                            //       controller.inspectionData.value.yearlyPlan = "0";
                            //     }
                            //
                            //   },
                            //
                            // ),

                            // TextFieldWidgetSmall(
                            //   labelText: "শ্রেণী কার্যক্রম পর্যবেক্ষণ",
                            //   hintText: "",
                            //   initialValue: '',
                            //   keyboardType: TextInputType.multiline,
                            //   onChanged: (input) {
                            //     //controller.techerIctTraining = input;
                            //     controller.inspectionData.value.shreniKarjo = input;
                            //   },
                            //
                            //   isLast: false,
                            // ),
                            //
                            // TextFieldWidgetSmall(
                            //   labelText: "ক্লাস আপগ্রেডেশন সাজেশন",
                            //   hintText: "ক্লাস আপগ্রেডেশন সাজেশন ",
                            //   initialValue: '',
                            //   keyboardType: TextInputType.multiline,
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.upgradationSuggession = input;
                            //   },
                            //
                            // ),
                            // TextFieldWidgetSmall(
                            //   labelText: "পূর্ববর্তী পরিদর্শনের বিবরণ (কর্মকর্তার নাম ,পদবি,তারিখ )",
                            //   hintText: "পূর্ববর্তী পরিদর্শনের বিবরণ (কর্মকর্তার নাম ,পদবি,তারিখ )",
                            //   initialValue: '',
                            //   keyboardType: TextInputType.multiline,
                            //   onChanged: (input) {
                            //     controller.inspectionData.value.previousInspetion = input;
                            //   },
                            //
                            // ),
                            //
                            //
                            // DropDownWidgetMenu(
                            //   labelText: "পূর্ববর্তী পরিদর্শকের সুপারিশ বাস্তবায়ন হয়েছে কি না?",
                            //   hintText: "পূর্ববর্তী পরিদর্শকের সুপারিশ বাস্তবায়ন হয়েছে কি না?",
                            //   initialValue: 'না',
                            //   data: ['হ্যাঁ', 'না'],
                            //   onChanged: (input) {
                            //     //controller.IsInternet.value = input!;
                            //     if(input == 'হ্যাঁ'){
                            //       controller.inspectionData.value.previousInspetionApply = "1";
                            //     }else{
                            //       controller.inspectionData.value.previousInspetionApply = "0";
                            //     }
                            //
                            //   },
                            //
                            // ),

                            TextFieldWidgetSmall(
                              controller: controller.overAllStatusEditContr.value,
                              labelText: "প্রতিষ্টানের সামগ্রিক অবস্থা",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                controller.inspectionData.value.overall_status = input;
                              },

                            ),

                            TextFieldWidgetSmall(
                              controller: controller.commentEditContr.value,
                              labelText: "সার্বিক মন্তব্য ও সুপারিশ",
                              hintText: "",
                              //initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                controller.inspectionData.value.comments = input;
                              },

                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.infoFormKey.currentState!.validate()) {
                                      controller.postInsPection('Darft');
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 100,
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
                                          "Draft",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    if (controller.infoFormKey.currentState!.validate()) {
                                      controller.postInsPection('Save');
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 100,
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
                                          "Save",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
          } 
          else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}