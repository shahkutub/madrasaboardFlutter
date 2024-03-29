/*
 * Copyright (c) 2020 .
 */

import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui.dart';

class MultipleSelectionDropDownWidget extends StatelessWidget {
  MultipleSelectionDropDownWidget({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.onTapped,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
    this.limit,
    this.data,
    //this.selectedValue,
    this.selectedValueString,
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final onChanged;
  final VoidCallback? onTapped;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<String>? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? limit;
  final data;
  //final selectedValue;
  final selectedValueString;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 14, left: 20, right: 20),
      margin: EdgeInsets.only(left: 10, right: 10, top: topMargin, bottom: bottomMargin),
      decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? "",
            style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
            textAlign: textAlign ?? TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          DropdownSearch<String>.multiSelection(

            mode: Mode.BOTTOM_SHEET,
            showSelectedItems: true,
            //itemAsString: selectedValueString,
            selectedItems: initialValue!,
            dropdownSearchBaseStyle: TextStyle(
              color: Color(0xffec008c),
            ),
            items: data,
            onChanged: onChanged,
            showSearchBox: true,
            dropdownSearchDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: TextStyle(
                  color: Color(0xffec008c),
                )),
          ),
        ],
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return BorderRadius.all(Radius.circular(0));
    }
    return BorderRadius.all(Radius.circular(10));
  }

  // String  itemString (){
  //   String data = jsonEncode(selectedValue);
  //   return data;
  // }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 10;
    } else if (isFirst == null) {
      return 10;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}