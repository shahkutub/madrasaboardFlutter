
class institute_sumary_list_response {
    ApiInfo? api_info;
    String? message;
    String? status;

    institute_sumary_list_response({this.api_info, this.message, this.status});

    factory institute_sumary_list_response.fromJson(Map<String, dynamic> json) {
        return institute_sumary_list_response(
            api_info: json['api_info'] != null ? ApiInfo.fromJson(json['api_info']) : null,
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.api_info != null) {
            data['api_info'] = this.api_info!.toJson();
        }
        return data;
    }
}

class ApiInfo {
    List<Data>? data;
    int? current_page;

    ApiInfo({this.data, this.current_page});

    factory ApiInfo.fromJson(Map<String, dynamic> json) {
        return ApiInfo(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            current_page: json['current_page'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['current_page'] = this.current_page;
        if (this.data != null) {
            data['data'] = this.data!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    String? district_name;
    String? division_name;
    String? eiin;
    int? id;
    String? name;
    String? phone;
    String? thana_name;

    Data({this.district_name, this.division_name, this.eiin, this.id, this.name, this.phone, this.thana_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            district_name: json['district_name'],
            division_name: json['division_name'],
            eiin: json['eiin'],
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            thana_name: json['thana_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['district_name'] = this.district_name;
        data['division_name'] = this.division_name;
        data['eiin'] = this.eiin;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['thana_name'] = this.thana_name;
        return data;
    }
}