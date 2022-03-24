import 'package:brac_arna/app/models/InstituteType.dart';

class InstituteTypeModel {
    List<InstituteType>? institute__type_list;

    InstituteTypeModel({ this.institute__type_list});

    factory InstituteTypeModel.fromJson(Map<String, dynamic> json) {
        return InstituteTypeModel(
            institute__type_list: json['institute__type_list'] != null ? (json['institute__type_list'] as List).map((i) => InstituteType.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.institute__type_list != null) {
            data['institute__type_list'] = this.institute__type_list?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}