import 'package:brac_arna/app/models/Institute.dart';

class InstitutionDataModel {
    List<Institute>? institute_list;

    InstitutionDataModel({this.institute_list});

    factory InstitutionDataModel.fromJson(Map<String, dynamic> json) {
        return InstitutionDataModel(
            institute_list: json['institute_list'] != null ? (json['institute_list'] as List).map((i) => Institute.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.institute_list != null) {
            data['institute_list'] = this.institute_list?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}