class InstituteTypeByEducationResponse {
    List<Data>? data;

    InstituteTypeByEducationResponse({this.data});

    factory InstituteTypeByEducationResponse.fromJson(Map<String, dynamic> json) {
        return InstituteTypeByEducationResponse(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data!.map((v) => v.toJson()).toList();
        }
        return data;
    }


}

class Data {
    int? id;
    String? name;

    Data({this.id, this.name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            id: json['id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;

        return data;
    }
}