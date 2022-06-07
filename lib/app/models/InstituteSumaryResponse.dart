class InstituteSumaryResponse {
    ApiInfo? api_info;
    String? message;
    String? status;

    InstituteSumaryResponse({this.api_info, this.message, this.status});

    factory InstituteSumaryResponse.fromJson(Map<String, dynamic> json) {
        return InstituteSumaryResponse(
            api_info: json['api_info'] != null ? ApiInfo.fromJson(json['api_info']) : null,
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        //if (this.api_info != null) {
            data['api_info'] = this.api_info;
        //}
        return data;
    }
}

class ApiInfo {
    int? total_digital_lab;
    int? total_electricity_facility;
    int? total_examinees;
    int? total_female_teacher;
    int? total_girls_students;
    int? total_internet_facility;
    int? total_male_students;
    int? total_male_teachers;
    int? total_mpo;
    int? total_multimedia_class_rooms;
    int? total_passed;
    int? total_students;
    int? total_teacher;

    ApiInfo({this.total_digital_lab, this.total_electricity_facility, this.total_examinees, this.total_female_teacher, this.total_girls_students, this.total_internet_facility, this.total_male_students, this.total_male_teachers, this.total_mpo, this.total_multimedia_class_rooms, this.total_passed, this.total_students, this.total_teacher});

    factory ApiInfo.fromJson(Map<String, dynamic> json) {
        return ApiInfo(
            total_digital_lab: json['total_digital_lab'],
            total_electricity_facility: json['total_electricity_facility'],
            total_examinees: json['total_examinees'],
            total_female_teacher: json['total_female_teacher'],
            total_girls_students: json['total_girls_students'],
            total_internet_facility: json['total_internet_facility'],
            total_male_students: json['total_male_students'],
            total_male_teachers: json['total_male_teachers'],
            total_mpo: json['total_mpo'],
            total_multimedia_class_rooms: json['total_multimedia_class_rooms'],
            total_passed: json['total_passed'],
            total_students: json['total_students'],
            total_teacher: json['total_teacher'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['total_digital_lab'] = this.total_digital_lab;
        data['total_electricity_facility'] = this.total_electricity_facility;
        data['total_examinees'] = this.total_examinees;
        data['total_female_teacher'] = this.total_female_teacher;
        data['total_girls_students'] = this.total_girls_students;
        data['total_internet_facility'] = this.total_internet_facility;
        data['total_male_students'] = this.total_male_students;
        data['total_male_teachers'] = this.total_male_teachers;
        data['total_mpo'] = this.total_mpo;
        data['total_multimedia_class_rooms'] = this.total_multimedia_class_rooms;
        data['total_passed'] = this.total_passed;
        data['total_students'] = this.total_students;
        data['total_teacher'] = this.total_teacher;
        return data;
    }
}