import 'package:brac_arna/app/modules/global_widgets/cliper.dart';
import 'package:brac_arna/app/modules/home/controllers/home_controller.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../global_widgets/dropdown_widget.dart';
import '../../global_widgets/dropdown_widget_small.dart';
import '../controllers/provided_data_list_controller.dart';

class provided_data_list_view_copy extends GetView<ProvidedDataListController> {
  final _size = Get.size;
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
              title: Text('পরিদশন তালিকা')
          ),
        ),
        body: Column(

          children: [

            DropDownWidget(
              labelText: "বিভাগ",
              hintText: "বিভাগ নির্বাচন করুন",
              initialValue: '',

              //data: controller.places.value.area!.map((item) => item.divisionName!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
             // data: controller.allDivDisTana!.value.division_list?.map((item) => item.name!).toList(),
              iconData: Icons.phone_android,
              onChanged: (input) {

                // controller.victimDivisionName.value =input;
                // for (var item in controller.allDivDisTana.value.division_list!) {
                //   if (item.name == input) {
                //     controller.victimDivision.value = item.id.toString();
                //     //controller.districtList.add(item);
                //     controller.inspectionData.value.division_id = item.id;
                //   }
                // }
                //
                //
                // //controller.getAldivDis();
                // print('divisionId: ${controller.victimDivision.value}');
                // //print('district: ${controller.districtList[0].name}');
                // controller.districtList.clear();
                // for (var itemd in controller.allDivDisTana.value.district_list!) {
                //   //print('divisionId: ${controller.victimDivision.value}');
                //   if (itemd.division_id.toString() == controller.victimDivision.value.toString().trim()) {
                //     print('divisionIddd: ${controller.victimDivision.value}');
                //     //controller.victimDivision.value = item.id.toString();
                //     controller.districtList.add(itemd);
                //
                //   }
                // }
                //print('district: ${controller.districtList[0].name}');
              },
              isFirst: true,
              isLast: false,
            ),

            Obx(() {
             // Get.put(ProvidedDataListController()).count.value++;
              if(controller.placeLoaded.isTrue){
                return  ListView(
                  primary: true,
                    children: [

                      DataTable(
                        columnSpacing: 30,
                        headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                        dataRowHeight: _size.height * .1,
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
                        rows: controller.reversedList
                            .map(
                              (data) => DataRow(

                              cells: [

                                DataCell(
                                    Text(
                                  data.institution_name.toString()+"\n"+ data.thana_name!+", "+ data.district_name!+", "+ data.division_name!
                                      +"\n পরিদর্শন তারিখঃ "+ data.updated_at!,
                                     // +"\n পরিদর্শন তারিখঃ "+ data.updated_at!,
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.black,
                                      backgroundColor: Colors.white
                                  ),
                                ),
                                onTap: (){
                                  controller.launchURL(data.details_url!);
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
                                    Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.green,
                                      size: 30.0,
                                    ),
                                    onTap: (){
                                      controller.launchURL(data.details_url!);
                                    }
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
                    ],
                  );
              }else {
                return Center(child: CircularProgressIndicator());
              }

            })
          ],
        )

    );
  }
}

//admin@gmail.com