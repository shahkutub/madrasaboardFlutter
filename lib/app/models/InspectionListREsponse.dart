import 'package:brac_arna/app/models/Inspection.dart';

class InspectionListREsponse {
    List<Inspection>? inspection_list;

    InspectionListREsponse({ this.inspection_list});

    factory InspectionListREsponse.fromJson(Map<String, dynamic> json) {
        return InspectionListREsponse(
            inspection_list: json['inspection_list'] != null ? (json['inspection_list'] as List).map((i) => Inspection.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.inspection_list != null) {
            data['inspection_list'] = this.inspection_list?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}