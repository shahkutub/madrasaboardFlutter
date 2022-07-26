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
            title: Text('শিক্ষা প্রতিঠান পরিদর্শন',
              textAlign: TextAlign.left,
            ),

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
              // SizedBox(
              //   width: 5,
              // ),
              // Center(
              //   child: Container(
              //     height: 30,
              //     width: 60,
              //     child: RawMaterialButton(
              //       onPressed: () {
              //         Get.find<AuthService>().removeCurrentUser();
              //         Get.toNamed(Routes.LOGIN);
              //       },
              //       elevation: 2.0,
              //       fillColor: Colors.red,
              //       child: Text("লগ আউট",
              //         style: TextStyle(color: Colors.white,fontSize: 10),
              //       ),
              //       padding: EdgeInsets.all(5.0),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //     ),
              //   ),
              // ),
              //
              // SizedBox(
              //   width: 5,
              // ),
              // Center(
              //   child: Container(
              //     height: 30,
              //
              //     child: RawMaterialButton(
              //       onPressed: () {
              //         Get.toNamed(Routes.PROVIDED_DATA_LIST);
              //       },
              //       elevation: 2.0,
              //       fillColor: Colors.indigo,
              //       child: Text("পরিদশন তালিকা",
              //         style: TextStyle(color: Colors.white,fontSize: 10),
              //       ),
              //       padding: EdgeInsets.all(5.0),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //     ),
              //   ),
              // ),


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


                            TextFieldWidgetSmall(
                              labelText: "প্রতিষ্ঠানের ই আই এন (EIN)",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {

                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "প্রতিষ্ঠানের নাম",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {

                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

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
                              initialValue: '',
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
                              initialValue: '',
                              iconData: Icons.phone_android,
                              data: controller.instituteData.value.institute_list?.map((item) => item.name!).toList(),
                              onChanged: (input) {

                                for (var item in controller.instituteData.value.institute_list!) {
                                  if (item.name == input) {
                                    controller.eiinNumber.value = item.eiin!;
                                    controller.inspectionData.value.institute_id = item.id;
                                  }
                                }


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

                            TextFieldWidgetSmall(
                              labelText: "শিক্ষা প্রতিষ্ঠানের ধরণ",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),


                            TextFieldWidgetSmall(
                              labelText: "পরিদর্শনকারী কর্মকর্তাদের নাম",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "পদবি",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {

                              },

                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "মোবাইল",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                //controller.victimAddress = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),


                            TextFieldWidget(
                              labelText: "ইমেইল",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                //controller.victimAddress = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),



                            TextFieldWidget(
                              labelText: "পরিদর্শনের তারিখ",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                //controller.victimAddress = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),
                            TextFieldWidgetSmall(
                              labelText: "প্রতিষ্ঠান প্রধানের নাম",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                //controller.instiruteHeadName = input;
                                controller.inspectionData.value.headmaster_name = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.person,
                              //iconData: IconData,
                              isFirst: true,
                              isLast: false,
                            ),
                            TextFieldWidgetSmall(
                              labelText: "মোবাইল নম্বর",
                              hintText: "",
                              initialValue: '',
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

                            TextFieldWidgetSmall(
                              labelText: "পদবি",
                              hintText: "",
                              initialValue: '',
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

                            TextFieldWidgetSmall(
                              labelText: "মোবাইল",
                              hintText: "",
                              initialValue: '',
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

                            TextFieldWidgetSmall(
                              labelText: "প্রতিষ্ঠানের মোট অনুমোদিত পদ",
                              hintText: "",
                              initialValue: '',
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



                            TextFieldWidgetSmall(
                              labelText: "কর্মরত মোট শিক্ষক সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.teacherCount = input;
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
                              labelText: "কর্মরত মোট শিক্ষিকার সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.femaleteacherCount = input;
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
                              labelText: "সংযুক্ত শিক্ষক সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.femaleteacherCount = input;
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
                              labelText: "শূন্য পদ সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.femaleteacherCount = input;
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
                              labelText: "উপস্থিত শিক্ষক/কর্মচারীর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.femaleteacherCount = input;
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
                              labelText: "অনুপস্থিত শিক্ষক/কর্মচারীর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.femaleteacherCount = input;
                                controller.inspectionData.value.total_women_teachers = input;

                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "শিক্ষক/শিক্ষিকা ফর্মাল পোশাকে আছে কি না?",
                              hintText: "শিক্ষক/শিক্ষিকা ফর্মাল পোশাকে আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //  controller.IsTecherTraining.value = input!;


                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.teacher_training = 1;
                                }else{
                                  controller.inspectionData.value.teacher_training = 0;
                                }
                                //controller.inspectionData.value.teacher_training = controller.IsTecherTraining.value.toString();


                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),
                            DropDownWidgetMenu(
                              labelText: "শিক্ষকদের আইসিটি প্রশিক্ষণ আছে কি না?",
                              hintText: "শিক্ষকদের আইসিটি প্রশিক্ষণ আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //  controller.IsTecherTraining.value = input!;


                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.teacher_training = 1;
                                }else{
                                  controller.inspectionData.value.teacher_training = 0;
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
                                  controller.inspectionData.value.teacher_training = 1;
                                }else{
                                  controller.inspectionData.value.teacher_training = 0;
                                }
                                //controller.inspectionData.value.teacher_training = controller.IsTecherTraining.value.toString();


                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),




                            TextFieldWidgetSmall(
                              labelText: "মোট ছাত্র-ছাত্রীর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                //controller.totalStudent.value = input as int;
                                controller.inspectionData.value.total_students = input;
                                print('total_students: ${controller.inspectionData.value.total_students}');

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
                              initialValue: '',
                              onChanged: (input) {
                               // controller.totalFemaleStudent.value = input as int;
                                controller.inspectionData.value.total_girls_students = input;
                                print('total_girls_students: ${controller.inspectionData.value.total_girls_students}');
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "বিশেষ চাহিদা সম্পন্ন শিক্ষার্থী থাকলে তাদের সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                               // controller.totalFemaleStudent.value = input as int;
                                controller.inspectionData.value.total_girls_students = input;
                                print('total_girls_students: ${controller.inspectionData.value.total_girls_students}');
                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "বৃত্তি প্রাপ্ত শিক্ষার্থীর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                // controller.totalFemaleStudent.value = input as int;
                                controller.inspectionData.value.total_girls_students = input;
                                print('total_girls_students: ${controller.inspectionData.value.total_girls_students}');
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
                                                  Text('কামিল',
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
                                                  Text('এস এস সি (ভোক)',
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
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('এস এস সি (ভোক)/এইচ এস সি (বিএমটি)',
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
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('ডিপ্লোমা ইঞ্জিনিয়ারিং ফাইনাল',
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
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('শর্ট কোর্স',
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
                                                  Text('কামিল',
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
                                                  Text('এস এস সি (ভোক)',
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
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('এস এস সি (ভোক)/এইচ এস সি (বিএমটি)',
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
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('ডিপ্লোমা ইঞ্জিনিয়ারিং ফাইনাল',
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
                                          TableRow(

                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10,top: 15.0,right: 5,bottom: 0.0),
                                                  child:
                                                  Text('শর্ট কোর্স',
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

                            TextFieldWidgetSmall(
                              labelText: "স্বীকৃতি প্রাপ্তির তারিখ",
                              hintText: "",
                              initialValue: "",
                              onChanged: (input) {
                                controller.multimediaRoomCount.value = input;
                                controller.inspectionData.value.total_multimedia_classroom = input;

                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "এমপিওভুক্তির তারিখ",
                              hintText: "",
                              initialValue: "",
                              onChanged: (input) {
                                controller.multimediaRoomCount.value = input;
                                controller.inspectionData.value.total_multimedia_classroom = input;

                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "বিদ্যুৎ সুবিধা",
                              hintText: "বিদ্যুৎ সুবিধা",
                              initialValue: 'না',
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
                              labelText: "মাল্টিমিডিয়া শ্রেণীকক্ষের সংখ্যা ",
                              hintText: "",
                              initialValue: "",
                              onChanged: (input) {
                                controller.multimediaRoomCount.value = input;
                                controller.inspectionData.value.total_multimedia_classroom = input;

                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),



                            TextFieldWidgetSmall(
                              labelText: "ডিজিটাল ল্যাব এর সংখ্যা",
                              hintText: "",
                              initialValue: '',
                              onChanged: (input) {
                                controller.skRaselLabCount.value = input;
                                controller.inspectionData.value.total_digital_lab = input;

                              },
                              keyboardType: TextInputType.number,
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              // iconData: Icons.person,
                              isFirst: true,
                              isLast: false,
                            ),


                            DropDownWidgetMenu(
                              labelText: "শেখ রাসেল ল্যাব",
                              hintText: "শেখ রাসেল ল্যাব",
                              initialValue: 'নাই',
                              data: ['আছে', 'নাই'],
                              onChanged: (input) {
                                if(input == 'নাই'){
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

                            DropDownWidgetMenu(
                              labelText: "অনলাইনে ক্লাস",
                              hintText: "অনলাইনে ক্লাস",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
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


                            DropDownWidgetMenu(
                              labelText: "পরিস্কার পরিচ্ছন্নতা",
                              hintText: "পরিস্কার পরিচ্ছন্নতা",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
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

                            DropDownWidgetMenu(
                              labelText: "প্রতিষ্ঠানের ক্যাচ ম্যান্ট এলাকার হালনাগাদ ম্যাপ আছে কি না?",
                              hintText: "প্রতিষ্ঠানের ক্যাচ ম্যান্ট এলাকার হালনাগাদ ম্যাপ আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
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
                            DropDownWidgetMenu(
                              labelText: "রেজিস্টার ও রেকর্ড পত্র সঠিক ভাবে ব্যবহার করা হয় কি না ?",
                              hintText: "রেজিস্টার ও রেকর্ড পত্র সঠিক ভাবে ব্যবহার করা হয় কি না ?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
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
                            DropDownWidgetMenu(
                              labelText: "শিক্ষার্থীদের নিয়ে সাপ্তাহিক ক্রিয়াকলাপ হয় কি না?",
                              hintText: "শিক্ষার্থীদের নিয়ে সাপ্তাহিক ক্রিয়াকলাপ হয় কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
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
                            DropDownWidgetMenu(
                              labelText: "প্রাথমিক চিকিৎসার ব্যবস্থা আছে কি না?",
                              hintText: "প্রাথমিক চিকিৎসার ব্যবস্থা আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                if(input == 'না'){
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


                            DropDownWidgetMenu(
                              labelText: "অভিভাবক সমাবেশ হয় কি না?",
                              hintText: "অভিভাবক সমাবেশ হয় কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "টয়লেট পরিষ্কার কি না?",
                              hintText: "টয়লেট পরিষ্কার কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "নিরাপদ পানির ব্যবস্থা আছে কি না?",
                              hintText: "নিরাপদ পানির ব্যবস্থা আছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "প্রতিষ্টানটি বৃক্ষ/গাছ দ্বারা পরিবেষ্টিত কী?",
                              hintText: "প্রতিষ্টানটি বৃক্ষ/গাছ দ্বারা পরিবেষ্টিত কী?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "শিক্ষার্থীদের পোশাক পরিচ্ছন্ন কি না?",
                              hintText: "শিক্ষার্থীদের পোশাক পরিচ্ছন্ন কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),


                             DropDownWidgetMenu(
                              labelText: "মানসিক স্বাস্থ্য কার্যক্রম হয় কি না?",
                              hintText: "মানসিক স্বাস্থ্য কার্যক্রম হয় কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),



                            TextFieldWidgetSmall(
                              labelText: "কোভিড-১৯ টিকা নিয়েছে কতজন শিক্ষার্থী?",
                              hintText: "",
                              initialValue: '',
                              keyboardType: TextInputType.number,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.cocurricular_activities = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            DropDownWidgetMenu(
                              labelText: "বার্ষিক পাঠ পরিকল্পনা আছে কি না ?",
                              hintText: "বার্ষিক পাঠ পরিকল্পনা আছে কি না ?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "শ্রেণী কার্যক্রম পর্যবেক্ষণ",
                              hintText: "",
                              initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.comments = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "ক্লাস আপগ্রেডেশন সাজেশন",
                              hintText: "ক্লাস আপগ্রেডেশন সাজেশন ",
                              initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.comments = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),
                            TextFieldWidgetSmall(
                              labelText: "পূর্ববর্তী পরিদর্শনের বিবরণ (কর্মকর্তার নাম ,পদবি,তারিখ )",
                              hintText: "পূর্ববর্তী পরিদর্শনের বিবরণ (কর্মকর্তার নাম ,পদবি,তারিখ )",
                              initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.comments = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),


                            DropDownWidgetMenu(
                              labelText: "পূর্ববর্তী পরিদর্শকের সুপারিশ বাস্তবায়ন হয়েছে কি না?",
                              hintText: "পূর্ববর্তী পরিদর্শকের সুপারিশ বাস্তবায়ন হয়েছে কি না?",
                              initialValue: 'না',
                              data: ['হ্যাঁ', 'না'],
                              onChanged: (input) {
                                //controller.IsInternet.value = input!;
                                if(input == 'হ্যাঁ'){
                                  controller.inspectionData.value.guardian_gathering = "1";
                                }else{
                                  controller.inspectionData.value.guardian_gathering = "0";
                                }

                              },
                              //iconData: Icons.merge_type,
                              isFirst: true,
                              isLast: false,
                            ),

                            TextFieldWidgetSmall(
                              labelText: "সার্বিক মন্তব্য ও সুপারিশ",
                              hintText: "",
                              initialValue: '',
                              keyboardType: TextInputType.multiline,
                              onChanged: (input) {
                                //controller.techerIctTraining = input;
                                controller.inspectionData.value.comments = input;
                              },
                              // limit: 255,
                              // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                              //iconData: Icons.phone_android,
                              isFirst: true,
                              isLast: false,
                            ),




                            GestureDetector(
                              onTap: () {
                                if (controller.infoFormKey.currentState!.validate()) {
                                  controller.postInsPection();
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