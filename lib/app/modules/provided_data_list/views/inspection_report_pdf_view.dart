import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/provided_data_list_controller.dart';

class InspectionReportPDFView extends GetView<ProvidedDataListController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<ProvidedDataListController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(60, 60),
        child: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          centerTitle: true,
          title: Text('পরিদর্শন রিপোর্ট পিডিএফ',
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
            SizedBox(
              width: 5,
            ),

            Center(
              child: Container(
                height: 30,

                child: RawMaterialButton(
                  onPressed: () {
                    controller.share();
                  },
                  elevation: 2.0,
                  fillColor: Colors.indigo,
                  child: Text("Share PDF",
                    style: TextStyle(color: Colors.white,fontSize: 10),
                  ),
                  padding: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),


          ],

        ),
      ),
      body: Obx(() {
        return SfPdfViewer.network(
        controller.pdfUrl.value,
        //'http://nanoit.biz/project/ei/inspection-report-public/pdf/2',
        );
      }

      )
    );
  }
}
