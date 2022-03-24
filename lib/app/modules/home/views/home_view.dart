import 'package:brac_arna/app/models/icon_model.dart';
import 'package:brac_arna/app/modules/global_widgets/cliper.dart';
import 'package:brac_arna/app/modules/home/widgets/crime_list.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends GetView<HomeController> {
  final _size = Get.size;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Colors.white,
  //       appBar: PreferredSize(
  //         preferredSize: Size(60, 60),
  //         child: AppBar(
  //             backgroundColor: Color(0xffec008c),
  //             elevation: 0,
  //             centerTitle: false,
  //             title: Row(
  //               children: [
  //                 Image.asset(
  //                   'assets/images/brac.png',
  //                   //  height: 50,
  //                   width: 80,
  //                   color: Colors.white,
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text(
  //                   'No more violence, let there be silence'.tr,
  //                   style: TextStyle(color: Colors.white, fontSize: 15),
  //                 )
  //               ],
  //             )),
  //       ),
  //       body: SingleChildScrollView(
  //         scrollDirection: Axis.vertical,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 height: _size.width * .3,
  //                 decoration: Ui.getBoxDecoration(
  //                     color: Colors.white,
  //                     border: Border.all(
  //                       color: Colors.pink,
  //                       width: 1,
  //                     ),
  //                     radius: 5),
  //                 child: Center(
  //                     child: RichText(
  //                   textAlign: TextAlign.center,
  //                   text: TextSpan(
  //                     children: [
  //                       TextSpan(
  //                         text: 'WELCOME'.tr,
  //                         style: TextStyle(color: Colors.black, fontSize: 25),
  //                       ),
  //                       TextSpan(
  //                         text: ' CLICK HERE'.tr,
  //                         style: TextStyle(color: Colors.pink, fontSize: 25),
  //                       ),
  //                       TextSpan(
  //                         text: ' To provide information'.tr,
  //                         style: TextStyle(color: Colors.black, fontSize: 25),
  //                       ),
  //                     ],
  //                   ),
  //                 )),
  //               ),
  //             ),
  //             // Center(
  //             //   child: Image.asset(
  //             //     'assets/images/logo.png',
  //             //     height: 200,
  //             //     width: 200,
  //             //   ),
  //             // ),
  //
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 width: Get.width,
  //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
  //                 child: GridView.count(
  //                     physics: NeverScrollableScrollPhysics(),
  //                     primary: false,
  //                     shrinkWrap: true,
  //                     crossAxisSpacing: 1,
  //                     mainAxisSpacing: 1,
  //                     childAspectRatio: 1.5,
  //                     crossAxisCount: 2,
  //                     children: List.generate(homeImage.length, (index) {
  //                       return Image.asset(
  //                         homeImage[index].image!,
  //                         fit: BoxFit.fill,
  //                         // height: 250,
  //                       );
  //                     })),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 width: _size.width,
  //                 decoration: Ui.getBoxDecoration(color: Colors.white, radius: 10),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Text(
  //                     'REPORTS',
  //                     style: TextStyle(fontSize: 20, letterSpacing: 1.2),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //
  //             CrimeListWidget(
  //               title: 'Crime Type',
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             CrimeListWidget(
  //               title: 'Crime Cause',
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             CrimeListWidget(
  //               title: 'Age Wise Crime',
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             CrimeListWidget(
  //               title: 'Crime Type',
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             CrimeListWidget(
  //               title: 'Crime Type',
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //           ],
  //         ),
  //       ));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(70, 70),
          child: AppBar(
              backgroundColor: Color(0xffec008c),
              elevation: 0,
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/brac.png',
                    //  height: 50,
                    width: 80,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                      // add icon, by default "3 dot" icon
                      // icon: Icon(Icons.book)
                      itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("Logout"),
                      ),
                    ];
                  }, onSelected: (value) {
                    Get.find<AuthService>().removeCurrentUser();
                    Get.offAllNamed(Routes.LOGIN);
                  }),
                ],
              )),
        ),
        body: ListView(
          primary: true,
          children: [
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 290,
                    decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.pink.shade100, Color(0xffec008c)])),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 0,
                  child: Text(
                    'No more violence, let there be silence'.tr,
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        height: 130,
                        decoration: Ui.getBoxDecoration(color: Colors.white, radius: 15),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 12),
                          child: Center(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'আপনি ${controller.dataList.length} টি তথ্য সরবরাহ করেছেন',
                                style: TextStyle(
                                  color: Color(0xffec008c),
                                  fontSize: 18,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'আপনার প্রদত্ত তথ্যের তালিকা দেখার জন্য',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.PROVIDED_DATA_LIST);
                                },
                                child: Center(
                                  child: Text(
                                    'এখানে ক্লিক করুন',
                                    style: TextStyle(color: Color(0xffec008c), fontSize: 16, letterSpacing: 1.2),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.INFORMATION_FORM);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: Color(0xffec008c),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'তথ্য প্রদানের জন্য ',
                                          style: TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 1.2),
                                        ),
                                        Text(
                                          'এখানে ক্লিক করুন',
                                          style: TextStyle(color: Color(0xffec008c), fontSize: 16, letterSpacing: 1.2),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      )),
                ),
                // Column(
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: <Widget>[
                //           Container(
                //             child: Image.asset(
                //               'asset/Menu.png',
                //               height: 30,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //           Container(
                //             child: Image.asset(
                //               'asset/Search.png',
                //               height: 30,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.all(20),
                //       child: Container(
                //         child: Image.asset(
                //           'asset/Coughing.png',
                //           height: 220,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),

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
            Divider(
              color: Color(
                0xFFF5f5ff,
              ),
              thickness: 10,
            ),
            Container(
              //height: _size.height,
              width: _size.width,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REPORTS'.tr,
                        style: TextStyle(
                          fontSize: 26,
                          letterSpacing: 1.5,
                          color: Color(0xffec008c),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 150,
                                width: _size.width * .42,
                                decoration: Ui.getBoxDecoration(
                                  color: Get.theme.cardColor,
                                  radius: 5,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Type of violence'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'ধর্ষণ(3), এসিড নির্যাতন(10)',
                                        style: TextStyle(fontSize: 12),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 150,
                                width: _size.width * .42,
                                decoration: Ui.getBoxDecoration(
                                  color: Get.theme.cardColor,
                                  radius: 5,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cause of the violence'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'দারিদ্র(3), যৌতুক(10)',
                                        style: TextStyle(fontSize: 12),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 150,
                                width: _size.width * .42,
                                decoration: Ui.getBoxDecoration(
                                  color: Get.theme.cardColor,
                                  radius: 5,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Age-based violence'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '৩২ বছর(3), ৪০ বছর(10)',
                                        style: TextStyle(fontSize: 12),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 150,
                                width: _size.width * .42,
                                decoration: Ui.getBoxDecoration(
                                  color: Get.theme.cardColor,
                                  radius: 5,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Types of criminals'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'ধোপা(3), ড্রাইভার(10)',
                                        style: TextStyle(fontSize: 12),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // GridView.count(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     primary: false,
                      //     shrinkWrap: true,
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 20.0,
                      //     mainAxisSpacing: 20.0,
                      //     childAspectRatio: 1.2,
                      //     children: List.generate(homeImage.length, (index) {
                      //       return GestureDetector(
                      //         child: Card(
                      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      //           child: Container(
                      //             height: 180,
                      //             decoration: Ui.getBoxDecoration(
                      //               color: Get.theme.cardColor,
                      //               radius: 5,
                      //             ),
                      //             child: Center(
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 children: [
                      //                   Text(
                      //                     homeImage[index].title!.tr,
                      //                     style: TextStyle(
                      //                       color: Color(0xffec008c),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text(
                      //                     homeImage[index].subTitle!.tr,
                      //                   ),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text(
                      //                     homeImage[index].value!,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     })),
                    ],
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Text(
            //     'Your Provided Info List'.tr,
            //     style: TextStyle(
            //       fontSize: 18,
            //       letterSpacing: 1.5,
            //       color: Color(0xffec008c),
            //     ),
            //   ),
            // ),
            // Obx(() {
            //   Get.put(HomeController()).count.value++;
            //   return SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: DataTable(
            //       columnSpacing: 25,
            //       decoration: BoxDecoration(
            //         color: Color(0xffec008c).withOpacity(0.7),
            //       ),
            //       dataRowHeight: _size.height * .1,
            //       columns: [
            //         DataColumn(
            //           label: Center(
            //             child: Text(
            //               'Name/Phone/Address'.tr,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //         DataColumn(
            //           label: Center(
            //             child: Text(
            //               'Violence Details'.tr,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //         DataColumn(
            //           label: Center(
            //             child: Text(
            //               'Violence Cause'.tr,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //         DataColumn(
            //           label: Center(
            //             child: Text(
            //               'Date'.tr,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //       rows: controller.dataList
            //           .map(
            //             (data) => DataRow(cells: [
            //               DataCell(Text(
            //                 data['VictimName'] + '\n' + data['MobileNo'] + '\n' + data['VictimAddress'],
            //                 maxLines: 5,
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //               )),
            //               DataCell(Text(
            //                 ' ',
            //                 maxLines: 5,
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //               )),
            //               DataCell(
            //                 Text(
            //                   data['PersecutionReasonList'].toString().replaceAll('[', '').replaceAll(']', ''),
            //                   maxLines: 5,
            //                   style: TextStyle(
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //               ),
            //               DataCell(Text(
            //                 data['PersecutionDateAndTime'] ?? '',
            //                 maxLines: 5,
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //               )),
            //             ]),
            //           )
            //           .toList(),
            //     ),
            //   );
            // })
          ],
        ));
  }
}
