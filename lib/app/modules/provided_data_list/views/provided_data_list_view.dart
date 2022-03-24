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
          title: Text('পূর্বের পরিদর্শন')
          ),
            // Stack(
            //   children: <Widget>[
            //     ClipPath(
            //       clipper: MyClipper(),
            //       child: Container(
            //         height: 290,
            //         decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.lightGreen, Colors.green])),
            //       ),
            //     ),
            //     // Positioned(
            //     //   top: 40,
            //     //   left: 20,
            //     //   right: 0,
            //     //   child: Text(
            //     //     'No more violence, let there be silence'.tr,
            //     //     style: TextStyle(color: Colors.white, fontSize: 23),
            //     //   ),
            //     // ),
            //     Positioned(
            //       bottom: 10,
            //       left: 0,
            //       right: 0,
            //       child: GestureDetector(
            //         onTap: () {
            //           Get.toNamed(Routes.INFORMATION_FORM);
            //         },
            //         child: Card(
            //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //             margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            //             child: Container(
            //               height: 120,
            //               decoration: Ui.getBoxDecoration(color: Colors.white, radius: 15),
            //               child: Padding(
            //                 padding: EdgeInsets.fromLTRB(20, 10, 20, 12),
            //                 child: Center(
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         // Text(
            //                         //   'আপনি ${controller.dataList.length} টি তথ্য সরবরাহ করেছেন',
            //                         //   style: TextStyle(
            //                         //     color: Color(0xffec008c),
            //                         //     fontSize: 18,
            //                         //     letterSpacing: 1.2,
            //                         //   ),
            //                         // ),
            //                         SizedBox(
            //                           height: 8,
            //                         ),
            //                         Row(
            //                           children: [
            //                             Icon(
            //                               Icons.add_circle,
            //                               color: Color(0xffec008c),
            //                               size: 25,
            //                             ),
            //                             SizedBox(
            //                               width: 10,
            //                             ),
            //                             Column(
            //                               children: [
            //                                 Text(
            //                                   'শিক্ষা প্রতিষ্ঠান পরিদর্শনের জন্য',
            //                                   style: TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 1.2),
            //                                 ),
            //                                 Text(
            //                                   'এখানে ক্লিক করুন',
            //                                   style: TextStyle(color: Color(0xffec008c), fontSize: 16, letterSpacing: 1.2),
            //                                 ),
            //                               ],
            //                             )
            //                           ],
            //                         ),
            //                         SizedBox(
            //                           height: 0,
            //                         ),
            //                         // InkWell(
            //                         //   onTap: () {
            //                         //     Get.back();
            //                         //   },
            //                         //   child: Text(
            //                         //     'ড্যাশবোর্ড এ ফিরে যান',
            //                         //     style: TextStyle(
            //                         //       color: Color(0xffec008c),
            //                         //       fontSize: 18,
            //                         //       letterSpacing: 1.2,
            //                         //     ),
            //                         //   ),
            //                         // ),
            //                       ],
            //                     )),
            //               ),
            //             )),
            //       ),
            //     ),
            //     // Column(
            //     //   children: <Widget>[
            //     //     Padding(
            //     //       padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            //     //       child: Row(
            //     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //         children: <Widget>[
            //     //           Container(
            //     //             child: Image.asset(
            //     //               'asset/Menu.png',
            //     //               height: 30,
            //     //               fit: BoxFit.cover,
            //     //             ),
            //     //           ),
            //     //           Container(
            //     //             child: Image.asset(
            //     //               'asset/Search.png',
            //     //               height: 30,
            //     //               fit: BoxFit.cover,
            //     //             ),
            //     //           )
            //     //         ],
            //     //       ),
            //     //     ),
            //     //     Padding(
            //     //       padding: EdgeInsets.all(20),
            //     //       child: Container(
            //     //         child: Image.asset(
            //     //           'asset/Coughing.png',
            //     //           height: 220,
            //     //           fit: BoxFit.cover,
            //     //         ),
            //     //       ),
            //     //     )
            //     //   ],
            //     // ),
            //   ],
            // ),

            // Container(
            //   //height: _size.height,
            //   width: _size.width,
            //   color: Colors.white,
            //   child: Padding(
            //       padding: const EdgeInsets.all(15.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'BANGLADESH'.tr,
            //             style: TextStyle(
            //               fontSize: 26,
            //               letterSpacing: 1.5,
            //               color: Color(0xffec008c),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 10,
            //           ),
            //           GridView.count(
            //               physics: NeverScrollableScrollPhysics(),
            //               primary: false,
            //               shrinkWrap: true,
            //               crossAxisCount: 2,
            //               crossAxisSpacing: 20.0,
            //               mainAxisSpacing: 20.0,
            //               childAspectRatio: 1.8,
            //               children: List.generate(population.length, (index) {
            //                 return GestureDetector(
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            //                     child: Container(
            //                       height: 180,
            //                       decoration: Ui.getBoxDecoration(
            //                         color: Get.theme.cardColor,
            //                         radius: 5,
            //                       ),
            //                       child: Center(
            //                           child: Column(
            //                         crossAxisAlignment: CrossAxisAlignment.center,
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Text(
            //                             population[index].title!.tr,
            //                           ),
            //                           SizedBox(
            //                             height: 5,
            //                           ),
            //                           Text(
            //                             population[index].value!,
            //                           ),
            //                         ],
            //                       )),
            //                     ),
            //                   ),
            //                 );
            //               })),
            //         ],
            //       )),
            // ),
            // Divider(
            //   color: Color(
            //     0xFFF5f5ff,
            //   ),
            //   thickness: 10,
            // ),

            //Padding(
             // padding: const EdgeInsets.all(10.0),
              // child: Text(
              //   'আপনি ${controller.dataList.length} টি তথ্য সরবরাহ করেছেন',
              //   style: TextStyle(
              //     fontSize: 18,
              //     letterSpacing: 1.5,
              //     color: Color(0xffec008c),
              //   ),
              // ),
           // ),

           // Text(
           //    'শিক্ষা প্রতিষ্ঠানের নাম',
           //    textAlign: TextAlign.center,
           //    style: TextStyle(
           //      color: Colors.black,
           //    ),
           //  ),

            Obx(() {
              Get.put(ProvidedDataListController()).count.value++;
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
                          'পরিদর্শকের নাম',
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
                  ],
                  rows: controller.poridorshonList
                      .map(
                        (data) => DataRow(cells: [
                      DataCell(Text(
                        data.namePoridorshok!,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      )),
                      DataCell(Text(
                        data.nameInstitute!,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      )),
                      DataCell(
                        Text(
                          data.location!,
                          maxLines: 5,
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      DataCell(Text(
                        data.date!,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      )),
                    ]),
                  ).toList(),
                ),
              );
            })
          ],
        ));
  }
}