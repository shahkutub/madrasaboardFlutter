

class InstitutionListResponse {
    List<ApiInfo>? api_info;
    String? message;
    String? status;

    InstitutionListResponse({this.api_info, this.message, this.status});

    factory InstitutionListResponse.fromJson(Map<String, dynamic> json) {
        return InstitutionListResponse(
            api_info: json['api_info'] != null ? (json['api_info'] as List).map((i) => ApiInfo.fromJson(i)).toList() : null,
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.api_info != null) {
            data['api_info'] = this.api_info!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class ApiInfo {
    String? alim_mpo_date;
    Object? alim_permited;
    String? alim_recognize;
    int? computer_lab;
    String? dakhil_mpo_date;
    String? dakhil_permited;
    String? dakhil_recognize;
    int? district_id;
    int? division_id;
    String? eiin;
    int? electricity;
    Object? fazil_mpo_date;
    Object? fazil_permited;
    Object? fazil_recognize;
    int? female_student;
    int? female_teacher;
    Object? headmaster_mobile;
    Object? headmaster_name;
    int? id;
    String? institute_id;
    int? institute_type_id;
    int? internet;
    Object? kamil_mpo_date;
    Object? kamil_permited;
    Object? kamil_recognize;
    Object? lat;
    Object? lng;
    int? multimedia_class_room;
    String? name;
    String? phone;
    int? thana_id;
    int? total_examinees;
    int? total_passed;
    int? total_student;
    int? total_teacher;

    ApiInfo({this.alim_mpo_date, this.alim_permited, this.alim_recognize, this.computer_lab, this.dakhil_mpo_date, this.dakhil_permited, this.dakhil_recognize, this.district_id, this.division_id, this.eiin, this.electricity, this.fazil_mpo_date, this.fazil_permited, this.fazil_recognize, this.female_student, this.female_teacher, this.headmaster_mobile, this.headmaster_name, this.id, this.institute_id, this.institute_type_id, this.internet, this.kamil_mpo_date, this.kamil_permited, this.kamil_recognize, this.lat, this.lng, this.multimedia_class_room, this.name, this.phone, this.thana_id, this.total_examinees, this.total_passed, this.total_student, this.total_teacher});

    factory ApiInfo.fromJson(Map<String, dynamic> json) {
        return ApiInfo(
            // alim_mpo_date: json['alim_mpo_date'] != null ? String?.fromJson(json['alim_mpo_date']) : null,
            // alim_permited: json['alim_permited'] != null ? Object.fromJson(json['alim_permited']) : null,
            // alim_recognize: json['alim_recognize'] != null ? String?.fromJson(json['alim_recognize']) : null,
            computer_lab: json['computer_lab'],
            // dakhil_mpo_date: json['dakhil_mpo_date'] != null ? String?.fromJson(json['dakhil_mpo_date']) : null,
            // dakhil_permited: json['dakhil_permited'] != null ? String?.fromJson(json['dakhil_permited']) : null,
            // dakhil_recognize: json['dakhil_recognize'] != null ? String?.fromJson(json['dakhil_recognize']) : null,
            district_id: json['district_id'],
            division_id: json['division_id'],
            eiin: json['eiin'],
            electricity: json['electricity'],
            // fazil_mpo_date: json['fazil_mpo_date'] != null ? Object.fromJson(json['fazil_mpo_date']) : null,
            // fazil_permited: json['fazil_permited'] != null ? Object.fromJson(json['fazil_permited']) : null,
            // fazil_recognize: json['fazil_recognize'] != null ? Object.fromJson(json['fazil_recognize']) : null,
            female_student: json['female_student'],
            female_teacher: json['female_teacher'],
            // headmaster_mobile: json['headmaster_mobile'] != null ? Object.fromJson(json['headmaster_mobile']) : null,
            // headmaster_name: json['headmaster_name'] != null ? Object.fromJson(json['headmaster_name']) : null,
            id: json['id'],
            institute_id: json['institute_id'],
            institute_type_id: json['institute_type_id'],
            internet: json['internet'],
            // kamil_mpo_date: json['kamil_mpo_date'] != null ? Object.fromJson(json['kamil_mpo_date']) : null,
            // kamil_permited: json['kamil_permited'] != null ? Object.fromJson(json['kamil_permited']) : null,
            // kamil_recognize: json['kamil_recognize'] != null ? Object.fromJson(json['kamil_recognize']) : null,
            // lat: json['lat'] != null ? Object.fromJson(json['lat']) : null,
            // lng: json['lng'] != null ? Object.fromJson(json['lng']) : null,
            // multimedia_class_room: json['multimedia_class_room'] != null ? int?.fromJson(json['multimedia_class_room']) : null,
            name: json['name'],
            phone: json['phone'],
            thana_id: json['thana_id'],
            total_examinees: json['total_examinees'],
            total_passed: json['total_passed'],
            total_student: json['total_student'],
            total_teacher: json['total_teacher'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['computer_lab'] = this.computer_lab;
        data['district_id'] = this.district_id;
        data['division_id'] = this.division_id;
        data['eiin'] = this.eiin;
        data['electricity'] = this.electricity;
        data['female_student'] = this.female_student;
        data['female_teacher'] = this.female_teacher;
        data['id'] = this.id;
        data['institute_id'] = this.institute_id;
        data['institute_type_id'] = this.institute_type_id;
        data['internet'] = this.internet;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['thana_id'] = this.thana_id;
        data['total_examinees'] = this.total_examinees;
        data['total_passed'] = this.total_passed;
        data['total_student'] = this.total_student;
        data['total_teacher'] = this.total_teacher;
        // if (this.alim_mpo_date != null) {
        //     data['alim_mpo_date'] = this.alim_mpo_date.toJson();
        // }
        // if (this.alim_permited != null) {
        //     data['alim_permited'] = this.alim_permited.toJson();
        // }
        // if (this.alim_recognize != null) {
        //     data['alim_recognize'] = this.alim_recognize.toJson();
        // }
        // if (this.dakhil_mpo_date != null) {
        //     data['dakhil_mpo_date'] = this.dakhil_mpo_date.toJson();
        // }
        // if (this.dakhil_permited != null) {
        //     data['dakhil_permited'] = this.dakhil_permited.toJson();
        // }
        // if (this.dakhil_recognize != null) {
        //     data['dakhil_recognize'] = this.dakhil_recognize.toJson();
        // }
        // if (this.fazil_mpo_date != null) {
        //     data['fazil_mpo_date'] = this.fazil_mpo_date.toJson();
        // }
        // if (this.fazil_permited != null) {
        //     data['fazil_permited'] = this.fazil_permited.toJson();
        // }
        // if (this.fazil_recognize != null) {
        //     data['fazil_recognize'] = this.fazil_recognize.toJson();
        // }
        // if (this.headmaster_mobile != null) {
        //     data['headmaster_mobile'] = this.headmaster_mobile.toJson();
        // }
        // if (this.headmaster_name != null) {
        //     data['headmaster_name'] = this.headmaster_name.toJson();
        // }
        // if (this.kamil_mpo_date != null) {
        //     data['kamil_mpo_date'] = this.kamil_mpo_date.toJson();
        // }
        // if (this.kamil_permited != null) {
        //     data['kamil_permited'] = this.kamil_permited.toJson();
        // }
        // if (this.kamil_recognize != null) {
        //     data['kamil_recognize'] = this.kamil_recognize.toJson();
        // }
        // if (this.lat != null) {
        //     data['lat'] = this.lat.toJson();
        // }
        // if (this.lng != null) {
        //     data['lng'] = this.lng.toJson();
        // }
        // if (this.multimedia_class_room != null) {
        //     data['multimedia_class_room'] = this.multimedia_class_room.toJson();
        // }
        return data;
    }
}