import 'District.dart';
import 'Division.dart';
import 'Thana.dart';

class all_division_dis_thanan_model {
    List<District>? district_list;
    List<Division>? division_list;
    List<Thana>? thana_list;

    all_division_dis_thanan_model({this.district_list, this.division_list,  this.thana_list});

    factory all_division_dis_thanan_model.fromJson(Map<String, dynamic> json) {
        return all_division_dis_thanan_model(
            district_list: json['district_list'] != null ? (json['district_list'] as List).map((i) => District.fromJson(i)).toList() : null, 
            division_list: json['division_list'] != null ? (json['division_list'] as List).map((i) => Division.fromJson(i)).toList() : null, 
            thana_list: json['thana_list'] != null ? (json['thana_list'] as List).map((i) => Thana.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.district_list != null) {
            data['district_list'] = this.district_list!.map((v) => v.toJson()).toList();
        }
        if (this.division_list != null) {
            data['division_list'] = this.division_list!.map((v) => v.toJson()).toList();
        }
        if (this.thana_list != null) {
            data['thana_list'] = this.thana_list!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}