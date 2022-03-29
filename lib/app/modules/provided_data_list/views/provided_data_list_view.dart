import 'package:brac_arna/app/modules/global_widgets/cliper.dart';
import 'package:brac_arna/app/modules/home/controllers/home_controller.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/provided_data_list_controller.dart';

class ProvidedDataListView extends GetView<ProvidedDataListController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: PreferredSize(
        //   preferredSize: Size(70, 70),
        //   child: AppBar(
        //       backgroundColor: Colors.green,
        //       elevation: 0,
        //       centerTitle: false,
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Image.asset(
        //             'assets/images/madsaraboardlogo.png',
        //             //  height: 50,
        //             width: 80,
        //             color: Colors.white,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           PopupMenuButton(
        //             // add icon, by default "3 dot" icon
        //             // icon: Icon(Icons.book)
        //               itemBuilder: (context) {
        //                 return [
        //                   PopupMenuItem<int>(
        //                     value: 2,
        //                     child: Text("Logout"),
        //                   ),
        //                 ];
        //               }, onSelected: (value) {
        //             Get.find<AuthService>().removeCurrentUser();
        //             Get.offAllNamed(Routes.LOGIN);
        //           }),
        //         ],
        //       )),
        // ),
        body: ListView(
          primary: true,
          children: [
          AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          centerTitle: true,
          title: Text('পরিদশন তালিকা')
          ),

            Obx(() {
             // Get.put(ProvidedDataListController()).count.value++;
              if(controller.placeLoaded.isTrue){
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 25,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    dataRowHeight: _size.height * .1,
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
                      DataColumn(
                        label: Center(
                          child: Text(
                            'ঠিকানা',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            'পরিদর্শনের তারিখ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      DataColumn(
                        label: Center(
                          child: Text(
                            'মন্তব্য',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: controller.inspectionListData.value.inspection_list!
                        .map(
                          (data) => DataRow(
                          cells: [

                            DataCell(Text(
                              data.institution_name.toString(),
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            )),
                            DataCell(
                              Text(
                                data.thana_name!,
                                maxLines: 5,
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            DataCell(Text(
                              data.updated_at!,
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            )),

                            DataCell(Text(
                              data.comments.toString(),
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            )),
                          ],

                          onSelectChanged: (value) {
                            controller.inspectListPos.value = data.id!;
                            // insert your navigation function here and use the selected value returned by the function
                            Get.toNamed(Routes.SINGLE_INSPECTION_VIEW);
                          }

                      ),
                    ).toList(),
                  ),
                );
              }else {
                return Center(child: CircularProgressIndicator());
              }

            })
          ],
        ));
  }
}

//admin@gmail.com