
class InspectorListResponse {
    List<Inspector>? inspectors;

    InspectorListResponse({this.inspectors});

    factory InspectorListResponse.fromJson(Map<String, dynamic> json) {
        return InspectorListResponse(
            inspectors: json['inspectors'] != null ? (json['inspectors'] as List).map((i) => Inspector.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.inspectors != null) {
            data['inspectors'] = this.inspectors?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Inspector {
    String? email;
    int? id;
    String? name;

    Inspector({ this.email,  this.id, this.name});

    factory Inspector.fromJson(Map<String, dynamic> json) {
        return Inspector(

            email: json['email'],

            id: json['id'],
            name: json['name'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;

        return data;
    }
}