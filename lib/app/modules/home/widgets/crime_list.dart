import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrimeListWidget extends StatelessWidget {
  final title;
  CrimeListWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: Ui.getBoxDecoration(color: Colors.white, radius: 10, border: Border.all(width: 1, color: Get.theme.hintColor)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 100, child: Text(title!)),
                  Container(width: 90, child: Text('Count')),
                  Container(width: 90, child: Text('%')),
                  Expanded(child: Container(width: 100, child: Text('National Mean'))),
                ],
              ),
            ),
            Column(
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2, top: 4, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 100, child: Text(title!)),
                          Container(width: 90, child: Text('200')),
                          Container(width: 90, child: Text('20')),
                          Container(width: 90, child: Text('20')),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
