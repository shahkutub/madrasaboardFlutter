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
        if (this.api_info != null) {
            data['api_info'] = this.api_info;
        }
        return data;
    }
}

class ApiInfo {
    int? no_electricity;
    int? no_internet;
    int? recognized_without_mpo;
    int? total_digital_lab;
    int? no_digital_lab;
    int? total_electricity_facility;
    int? total_examinees;
    int? total_female_teacher;
    int? total_girls_students;
    int? total_internet_facility;
    int? total_male_students;
    int? total_male_teachers;
    int? total_mpo;
    int? total_multimedia_class_rooms;
    int? no_multimedia;
    int? total_passed;
    int? total_recognized;
    int? total_students;
    int? total_teacher;
    int? total_institutions;

    ApiInfo({this.no_electricity, this.no_internet, this.recognized_without_mpo, this.total_digital_lab,this.no_digital_lab, this.total_electricity_facility, this.total_examinees, this.total_female_teacher, this.total_girls_students, this.total_internet_facility, this.total_male_students, this.total_male_teachers, this.total_mpo, this.total_multimedia_class_rooms, this.no_multimedia,this.total_passed, this.total_recognized, this.total_students, this.total_teacher,this.total_institutions});

    factory ApiInfo.fromJson(Map<String, dynamic> json) {
        return ApiInfo(
            no_electricity: json['no_electricity'],
            no_internet: json['no_internet'],
            recognized_without_mpo: json['recognized_without_mpo'],
            total_digital_lab: json['total_digital_lab'],
            no_digital_lab: json['no_digital_lab'],
            total_electricity_facility: json['total_electricity_facility'],
            total_examinees: json['total_examinees'],
            total_female_teacher: json['total_female_teacher'],
            total_girls_students: json['total_girls_students'],
            total_internet_facility: json['total_internet_facility'],
            total_male_students: json['total_male_students'],
            total_male_teachers: json['total_male_teachers'],
            total_mpo: json['total_mpo'],
            total_multimedia_class_rooms: json['total_multimedia_class_rooms'],
            no_multimedia: json['no_multimedia'],
            total_passed: json['total_passed'],
            total_recognized: json['total_recognized'],
            total_students: json['total_students'],
            total_teacher: json['total_teacher'],
            total_institutions: json['total_institutions'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['no_electricity'] = this.no_electricity;
        data['no_internet'] = this.no_internet;
        data['recognized_without_mpo'] = this.recognized_without_mpo;
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
        data['total_recognized'] = this.total_recognized;
        data['total_students'] = this.total_students;
        data['total_teacher'] = this.total_teacher;
        data['total_institutions'] = this.total_institutions;
        return data;
    }
}