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
