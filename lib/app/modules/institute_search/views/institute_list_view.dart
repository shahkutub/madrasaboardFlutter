import 'package:basic_utils/basic_utils.dart';
import 'package:brac_arna/app/modules/global_widgets/cliper.dart';
import 'package:brac_arna/app/modules/home/controllers/home_controller.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

import '../../global_widgets/dropdown_widget.dart';
import '../../global_widgets/dropdown_widget_small.dart';
import '../controllers/institute_search_controller.dart';

class InstituteListView extends GetView<InstituteSearchController> {
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
            title: Obx(() {
              return Text(''+controller.instituteListTitle.value);
            }),
          ),
        ),
        body:  Column(
          // primary: true,
          children: [


            SizedBox(
              height: 10,
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

            // Obx(() {
            //  return Text(''+controller.instituteListTitle.value);
            // }),

            Obx(() {
              // Get.put(ProvidedDataListController()).count.value++;
              if(controller.placeLoaded.value == true){
                return RefreshIndicator(child:
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.instituteListSummaryBased.value.api_info!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var sn = index+1;
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              //width: MediaQuery.of(context).size.width -20,

                              child: Row(
                                children: [
                                  // Text(''+sn.toString()+'    ',
                                  //   style: TextStyle(fontSize: 12,color: Colors.red),
                                  // ),

                                  Expanded(
                                      child: Text(StringUtils.capitalize(controller.instituteListSummaryBased.value.api_info!.data![index].name.toString()),
                                        style: TextStyle(fontSize: 12,color: Colors.indigo,),
                                      )
                                  ),

                                ],
                              ),



                            ),

                          );
                        }
                    )),
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 1), () {
                        controller.page.value =  controller.page.value+1 ;
                      controller.instituteListSumaryBased();
                      },
                    );
                  },
                );
              }else {
                return Center(child: CircularProgressIndicator());
              }

            })
          ],
        ),
      // bottomNavigationBar: FloatingNavbar(
      //   onTap: (int val) {},
      //   currentIndex: 0,
      //   items: [
      //     FloatingNavbarItem(icon: Icons.home, title: 'Home'),
      //     FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
      //     FloatingNavbarItem(icon: Icons.chat_bubble_outline,),
      //     FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
      //   ],
      // ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    //await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    controller.instituteListSumaryBased();
    return true;
  }

}

//admin@gmail.com