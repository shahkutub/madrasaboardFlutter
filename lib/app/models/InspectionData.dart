//
// class InspectionData {
//     List<Inspection> inspection_list;
//
//     InspectionData({this.inspection_list});
//
//     factory InspectionData.fromJson(Map<String, dynamic> json) {
//         return InspectionData(
//             inspection_list: json['inspection_list'] != null ? (json['inspection_list'] as List).map((i) => Inspection.fromJson(i)).toList() : null,
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         if (this.inspection_list != null) {
//             data['inspection_list'] = this.inspection_list.map((v) => v.toJson()).toList();
//         }
//         return data;
//     }
// }
//
// class Inspection {
//     Object approval_date;
//     Object class_inspection;
//     Object class_upgradation_suggestion;
//     String cleaning_steps;
//     Object cocurricular_activities;
//     Object comments;
//     Object covid19_vaccinated;
//     String created_at;
//     int created_by;
//     String details_url;
//     District district;
//     int district_id;
//     String district_name;
//     Division division;
//     int division_id;
//     String division_name;
//     int electricity_facility;
//     Object first_aid_description;
//     int guardian_gathering;
//     Object headmaster_mobile_no;
//     Object headmaster_name;
//     String ict_training;
//     int id;
//     String inspection_date;
//     List<InspectionInspector>? inspection_inspector_list;
//     Institute institute;
//     int institute_id;
//     int institute_type;
//     String institution_name;
//     int internet_facility;
//     Object mental_health_activities;
//     Object mpo_date;
//     int online_class;
//     Object overall_status;
//     Object soft_skill_description;
//     int status;
//     int teacher_training;
//     Thana thana;
//     int thana_id;
//     String thana_name;
//     Object total_digital_lab;
//     Object total_examinees;
//     Object total_girls_students;
//     Object total_multimedia_classroom;
//     Object total_passed;
//     Object total_students;
//     Object total_teachers;
//     Object total_women_teachers;
//     String updated_at;
//     Object week_studuents_activities;
//     int year;
//
//     Inspection({this.approval_date, this.class_inspection, this.class_upgradation_suggestion, this.cleaning_steps, this.cocurricular_activities, this.comments, this.covid19_vaccinated, this.created_at, this.created_by, this.details_url, this.district, this.district_id, this.district_name, this.division, this.division_id, this.division_name, this.electricity_facility, this.first_aid_description, this.guardian_gathering, this.headmaster_mobile_no, this.headmaster_name, this.ict_training, this.id, this.inspection_date, this.inspection_inspector_list, this.institute, this.institute_id, this.institute_type, this.institution_name, this.internet_facility, this.mental_health_activities, this.mpo_date, this.online_class, this.overall_status, this.soft_skill_description, this.status, this.teacher_training, this.thana, this.thana_id, this.thana_name, this.total_digital_lab, this.total_examinees, this.total_girls_students, this.total_multimedia_classroom, this.total_passed, this.total_students, this.total_teachers, this.total_women_teachers, this.updated_at, this.week_studuents_activities, this.year});
//
//     factory Inspection.fromJson(Map<String, dynamic> json) {
//         return Inspection(
//             approval_date: json['approval_date'] != null ? Object.fromJson(json['approval_date']) : null,
//             class_inspection: json['class_inspection'] != null ? Object.fromJson(json['class_inspection']) : null,
//             class_upgradation_suggestion: json['class_upgradation_suggestion'] != null ? Object.fromJson(json['class_upgradation_suggestion']) : null,
//             cleaning_steps: json['cleaning_steps'],
//             cocurricular_activities: json['cocurricular_activities'] != null ? Object.fromJson(json['cocurricular_activities']) : null,
//             comments: json['comments'] != null ? Object.fromJson(json['comments']) : null,
//             covid19_vaccinated: json['covid19_vaccinated'] != null ? Object.fromJson(json['covid19_vaccinated']) : null,
//             created_at: json['created_at'],
//             created_by: json['created_by'],
//             details_url: json['details_url'],
//             district: json['district'] != null ? District.fromJson(json['district']) : null,
//             district_id: json['district_id'],
//             district_name: json['district_name'],
//             division: json['division'] != null ? Division.fromJson(json['division']) : null,
//             division_id: json['division_id'],
//             division_name: json['division_name'],
//             electricity_facility: json['electricity_facility'],
//             first_aid_description: json['first_aid_description'] != null ? Object.fromJson(json['first_aid_description']) : null,
//             guardian_gathering: json['guardian_gathering'],
//             headmaster_mobile_no: json['headmaster_mobile_no'] != null ? Object.fromJson(json['headmaster_mobile_no']) : null,
//             headmaster_name: json['headmaster_name'] != null ? Object.fromJson(json['headmaster_name']) : null,
//             ict_training: json['ict_training'],
//             id: json['id'],
//             inspection_date: json['inspection_date'],
//             inspection_inspector_list: json['inspection_inspector_list'] != null ? (json['inspection_inspector_list'] as List).map((i) => InspectionInspector.fromJson(i)).toList() : null,
//             institute: json['institute'] != null ? Institute.fromJson(json['institute']) : null,
//             institute_id: json['institute_id'],
//             institute_type: json['institute_type'],
//             institution_name: json['institution_name'],
//             internet_facility: json['internet_facility'],
//             mental_health_activities: json['mental_health_activities'] != null ? Object.fromJson(json['mental_health_activities']) : null,
//             mpo_date: json['mpo_date'] != null ? Object.fromJson(json['mpo_date']) : null,
//             online_class: json['online_class'],
//             overall_status: json['overall_status'] != null ? Object.fromJson(json['overall_status']) : null,
//             soft_skill_description: json['soft_skill_description'] != null ? Object.fromJson(json['soft_skill_description']) : null,
//             status: json['status'],
//             teacher_training: json['teacher_training'],
//             thana: json['thana'] != null ? Thana.fromJson(json['thana']) : null,
//             thana_id: json['thana_id'],
//             thana_name: json['thana_name'],
//             total_digital_lab: json['total_digital_lab'] != null ? Object.fromJson(json['total_digital_lab']) : null,
//             total_examinees: json['total_examinees'] != null ? Object.fromJson(json['total_examinees']) : null,
//             total_girls_students: json['total_girls_students'] != null ? Object.fromJson(json['total_girls_students']) : null,
//             total_multimedia_classroom: json['total_multimedia_classroom'] != null ? Object.fromJson(json['total_multimedia_classroom']) : null,
//             total_passed: json['total_passed'] != null ? Object.fromJson(json['total_passed']) : null,
//             total_students: json['total_students'] != null ? Object.fromJson(json['total_students']) : null,
//             total_teachers: json['total_teachers'] != null ? Object.fromJson(json['total_teachers']) : null,
//             total_women_teachers: json['total_women_teachers'] != null ? Object.fromJson(json['total_women_teachers']) : null,
//             updated_at: json['updated_at'],
//             week_studuents_activities: json['week_studuents_activities'] != null ? Object.fromJson(json['week_studuents_activities']) : null,
//             year: json['year'],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['cleaning_steps'] = this.cleaning_steps;
//         data['created_at'] = this.created_at;
//         data['created_by'] = this.created_by;
//         data['details_url'] = this.details_url;
//         data['district_id'] = this.district_id;
//         data['district_name'] = this.district_name;
//         data['division_id'] = this.division_id;
//         data['division_name'] = this.division_name;
//         data['electricity_facility'] = this.electricity_facility;
//         data['guardian_gathering'] = this.guardian_gathering;
//         data['ict_training'] = this.ict_training;
//         data['id'] = this.id;
//         data['inspection_date'] = this.inspection_date;
//         data['institute_id'] = this.institute_id;
//         data['institute_type'] = this.institute_type;
//         data['institution_name'] = this.institution_name;
//         data['internet_facility'] = this.internet_facility;
//         data['online_class'] = this.online_class;
//         data['status'] = this.status;
//         data['teacher_training'] = this.teacher_training;
//         data['thana_id'] = this.thana_id;
//         data['thana_name'] = this.thana_name;
//         data['updated_at'] = this.updated_at;
//         data['year'] = this.year;
//         if (this.approval_date != null) {
//             data['approval_date'] = this.approval_date.toJson();
//         }
//         if (this.class_inspection != null) {
//             data['class_inspection'] = this.class_inspection.toJson();
//         }
//         if (this.class_upgradation_suggestion != null) {
//             data['class_upgradation_suggestion'] = this.class_upgradation_suggestion.toJson();
//         }
//         if (this.cocurricular_activities != null) {
//             data['cocurricular_activities'] = this.cocurricular_activities.toJson();
//         }
//         if (this.comments != null) {
//             data['comments'] = this.comments.toJson();
//         }
//         if (this.covid19_vaccinated != null) {
//             data['covid19_vaccinated'] = this.covid19_vaccinated.toJson();
//         }
//         if (this.district != null) {
//             data['district'] = this.district.toJson();
//         }
//         if (this.division != null) {
//             data['division'] = this.division.toJson();
//         }
//         if (this.first_aid_description != null) {
//             data['first_aid_description'] = this.first_aid_description.toJson();
//         }
//         if (this.headmaster_mobile_no != null) {
//             data['headmaster_mobile_no'] = this.headmaster_mobile_no.toJson();
//         }
//         if (this.headmaster_name != null) {
//             data['headmaster_name'] = this.headmaster_name.toJson();
//         }
//         if (this.inspection_inspector_list != null) {
//             data['inspection_inspector_list'] = this.inspection_inspector_list?.map((v) => v.toJson()).toList();
//         }
//         if (this.institute != null) {
//             data['institute'] = this.institute.toJson();
//         }
//         if (this.mental_health_activities != null) {
//             data['mental_health_activities'] = this.mental_health_activities.toJson();
//         }
//         if (this.mpo_date != null) {
//             data['mpo_date'] = this.mpo_date.toJson();
//         }
//         if (this.overall_status != null) {
//             data['overall_status'] = this.overall_status.toJson();
//         }
//         if (this.soft_skill_description != null) {
//             data['soft_skill_description'] = this.soft_skill_description.toJson();
//         }
//         if (this.thana != null) {
//             data['thana'] = this.thana.toJson();
//         }
//         if (this.total_digital_lab != null) {
//             data['total_digital_lab'] = this.total_digital_lab.toJson();
//         }
//         if (this.total_examinees != null) {
//             data['total_examinees'] = this.total_examinees.toJson();
//         }
//         if (this.total_girls_students != null) {
//             data['total_girls_students'] = this.total_girls_students.toJson();
//         }
//         if (this.total_multimedia_classroom != null) {
//             data['total_multimedia_classroom'] = this.total_multimedia_classroom.toJson();
//         }
//         if (this.total_passed != null) {
//             data['total_passed'] = this.total_passed.toJson();
//         }
//         if (this.total_students != null) {
//             data['total_students'] = this.total_students.toJson();
//         }
//         if (this.total_teachers != null) {
//             data['total_teachers'] = this.total_teachers.toJson();
//         }
//         if (this.total_women_teachers != null) {
//             data['total_women_teachers'] = this.total_women_teachers.toJson();
//         }
//         if (this.week_studuents_activities != null) {
//             data['week_studuents_activities'] = this.week_studuents_activities.toJson();
//         }
//         return data;
//     }
// }
//
// class InspectionInspector {
//     String? created_at;
//     int? id;
//     int? inspection_id;
//     int? inspector_id;
//     String? updated_at;
//
//     InspectionInspector({this.created_at, this.id, this.inspection_id, this.inspector_id, this.updated_at});
//
//     factory InspectionInspector.fromJson(Map<String, dynamic> json) {
//         return InspectionInspector(
//             created_at: json['created_at'],
//             id: json['id'],
//             inspection_id: json['inspection_id'],
//             inspector_id: json['inspector_id'],
//             updated_at: json['updated_at'],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['created_at'] = this.created_at;
//         data['id'] = this.id;
//         data['inspection_id'] = this.inspection_id;
//         data['inspector_id'] = this.inspector_id;
//         data['updated_at'] = this.updated_at;
//         return data;
//     }
// }
//
// class District {
//     Object created_at;
//     int division_id;
//     int id;
//     String name;
//     Object updated_at;
//
//     District({this.created_at, this.division_id, this.id, this.name, this.updated_at});
//
//     factory District.fromJson(Map<String, dynamic> json) {
//         return District(
//             created_at: json['created_at'] != null ? Object.fromJson(json['created_at']) : null,
//             division_id: json['division_id'],
//             id: json['id'],
//             name: json['name'],
//             updated_at: json['updated_at'] != null ? Object.fromJson(json['updated_at']) : null,
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['division_id'] = this.division_id;
//         data['id'] = this.id;
//         data['name'] = this.name;
//         if (this.created_at != null) {
//             data['created_at'] = this.created_at.toJson();
//         }
//         if (this.updated_at != null) {
//             data['updated_at'] = this.updated_at.toJson();
//         }
//         return data;
//     }
// }
//
// class Institute {
//     Object alim_mpo_date;
//     Object alim_permited;
//     Object alim_recognize;
//     Object bm_mpo_date;
//     int computer_lab;
//     Object dakhil_mpo_date;
//     Object dakhil_permited;
//     Object dakhil_recognize;
//     Object dip_in_agriculture_mpo_date;
//     Object diploma_mpo_date;
//     int district_id;
//     int division_id;
//     String eiin;
//     int electricity;
//     Object fazil_mpo_date;
//     Object fazil_permited;
//     Object fazil_recognize;
//     int female_student;
//     int female_teacher;
//     Object headmaster_mobile;
//     Object headmaster_name;
//     int id;
//     String institute_id;
//     int institute_type_id;
//     int internet;
//     Object kamil_mpo_date;
//     Object kamil_permited;
//     Object kamil_recognize;
//     Object lat;
//     Object lng;
//     int multimedia_class_room;
//     String name;
//     String phone;
//     int thana_id;
//     int total_examinees;
//     int total_passed;
//     int total_student;
//     int total_teacher;
//     Object voc_mpo_date;
//
//     Institute({this.alim_mpo_date, this.alim_permited, this.alim_recognize, this.bm_mpo_date, this.computer_lab, this.dakhil_mpo_date, this.dakhil_permited, this.dakhil_recognize, this.dip_in_agriculture_mpo_date, this.diploma_mpo_date, this.district_id, this.division_id, this.eiin, this.electricity, this.fazil_mpo_date, this.fazil_permited, this.fazil_recognize, this.female_student, this.female_teacher, this.headmaster_mobile, this.headmaster_name, this.id, this.institute_id, this.institute_type_id, this.internet, this.kamil_mpo_date, this.kamil_permited, this.kamil_recognize, this.lat, this.lng, this.multimedia_class_room, this.name, this.phone, this.thana_id, this.total_examinees, this.total_passed, this.total_student, this.total_teacher, this.voc_mpo_date});
//
//     factory Institute.fromJson(Map<String, dynamic> json) {
//         return Institute(
//             alim_mpo_date: json['alim_mpo_date'] != null ? Object.fromJson(json['alim_mpo_date']) : null,
//             alim_permited: json['alim_permited'] != null ? Object.fromJson(json['alim_permited']) : null,
//             alim_recognize: json['alim_recognize'] != null ? Object.fromJson(json['alim_recognize']) : null,
//             bm_mpo_date: json['bm_mpo_date'] != null ? Object.fromJson(json['bm_mpo_date']) : null,
//             computer_lab: json['computer_lab'],
//             dakhil_mpo_date: json['dakhil_mpo_date'] != null ? Object.fromJson(json['dakhil_mpo_date']) : null,
//             dakhil_permited: json['dakhil_permited'] != null ? Object.fromJson(json['dakhil_permited']) : null,
//             dakhil_recognize: json['dakhil_recognize'] != null ? Object.fromJson(json['dakhil_recognize']) : null,
//             dip_in_agriculture_mpo_date: json['dip_in_agriculture_mpo_date'] != null ? Object.fromJson(json['dip_in_agriculture_mpo_date']) : null,
//             diploma_mpo_date: json['diploma_mpo_date'] != null ? Object.fromJson(json['diploma_mpo_date']) : null,
//             district_id: json['district_id'],
//             division_id: json['division_id'],
//             eiin: json['eiin'],
//             electricity: json['electricity'],
//             fazil_mpo_date: json['fazil_mpo_date'] != null ? Object.fromJson(json['fazil_mpo_date']) : null,
//             fazil_permited: json['fazil_permited'] != null ? Object.fromJson(json['fazil_permited']) : null,
//             fazil_recognize: json['fazil_recognize'] != null ? Object.fromJson(json['fazil_recognize']) : null,
//             female_student: json['female_student'],
//             female_teacher: json['female_teacher'],
//             headmaster_mobile: json['headmaster_mobile'] != null ? Object.fromJson(json['headmaster_mobile']) : null,
//             headmaster_name: json['headmaster_name'] != null ? Object.fromJson(json['headmaster_name']) : null,
//             id: json['id'],
//             institute_id: json['institute_id'],
//             institute_type_id: json['institute_type_id'],
//             internet: json['internet'],
//             kamil_mpo_date: json['kamil_mpo_date'] != null ? Object.fromJson(json['kamil_mpo_date']) : null,
//             kamil_permited: json['kamil_permited'] != null ? Object.fromJson(json['kamil_permited']) : null,
//             kamil_recognize: json['kamil_recognize'] != null ? Object.fromJson(json['kamil_recognize']) : null,
//             lat: json['lat'] != null ? Object.fromJson(json['lat']) : null,
//             lng: json['lng'] != null ? Object.fromJson(json['lng']) : null,
//             multimedia_class_room: json['multimedia_class_room'],
//             name: json['name'],
//             phone: json['phone'],
//             thana_id: json['thana_id'],
//             total_examinees: json['total_examinees'],
//             total_passed: json['total_passed'],
//             total_student: json['total_student'],
//             total_teacher: json['total_teacher'],
//             voc_mpo_date: json['voc_mpo_date'] != null ? Object.fromJson(json['voc_mpo_date']) : null,
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['computer_lab'] = this.computer_lab;
//         data['district_id'] = this.district_id;
//         data['division_id'] = this.division_id;
//         data['eiin'] = this.eiin;
//         data['electricity'] = this.electricity;
//         data['female_student'] = this.female_student;
//         data['female_teacher'] = this.female_teacher;
//         data['id'] = this.id;
//         data['institute_id'] = this.institute_id;
//         data['institute_type_id'] = this.institute_type_id;
//         data['internet'] = this.internet;
//         data['multimedia_class_room'] = this.multimedia_class_room;
//         data['name'] = this.name;
//         data['phone'] = this.phone;
//         data['thana_id'] = this.thana_id;
//         data['total_examinees'] = this.total_examinees;
//         data['total_passed'] = this.total_passed;
//         data['total_student'] = this.total_student;
//         data['total_teacher'] = this.total_teacher;
//         if (this.alim_mpo_date != null) {
//             data['alim_mpo_date'] = this.alim_mpo_date.toJson();
//         }
//         if (this.alim_permited != null) {
//             data['alim_permited'] = this.alim_permited.toJson();
//         }
//         if (this.alim_recognize != null) {
//             data['alim_recognize'] = this.alim_recognize.toJson();
//         }
//         if (this.bm_mpo_date != null) {
//             data['bm_mpo_date'] = this.bm_mpo_date.toJson();
//         }
//         if (this.dakhil_mpo_date != null) {
//             data['dakhil_mpo_date'] = this.dakhil_mpo_date.toJson();
//         }
//         if (this.dakhil_permited != null) {
//             data['dakhil_permited'] = this.dakhil_permited.toJson();
//         }
//         if (this.dakhil_recognize != null) {
//             data['dakhil_recognize'] = this.dakhil_recognize.toJson();
//         }
//         if (this.dip_in_agriculture_mpo_date != null) {
//             data['dip_in_agriculture_mpo_date'] = this.dip_in_agriculture_mpo_date.toJson();
//         }
//         if (this.diploma_mpo_date != null) {
//             data['diploma_mpo_date'] = this.diploma_mpo_date.toJson();
//         }
//         if (this.fazil_mpo_date != null) {
//             data['fazil_mpo_date'] = this.fazil_mpo_date.toJson();
//         }
//         if (this.fazil_permited != null) {
//             data['fazil_permited'] = this.fazil_permited.toJson();
//         }
//         if (this.fazil_recognize != null) {
//             data['fazil_recognize'] = this.fazil_recognize.toJson();
//         }
//         if (this.headmaster_mobile != null) {
//             data['headmaster_mobile'] = this.headmaster_mobile.toJson();
//         }
//         if (this.headmaster_name != null) {
//             data['headmaster_name'] = this.headmaster_name.toJson();
//         }
//         if (this.kamil_mpo_date != null) {
//             data['kamil_mpo_date'] = this.kamil_mpo_date.toJson();
//         }
//         if (this.kamil_permited != null) {
//             data['kamil_permited'] = this.kamil_permited.toJson();
//         }
//         if (this.kamil_recognize != null) {
//             data['kamil_recognize'] = this.kamil_recognize.toJson();
//         }
//         if (this.lat != null) {
//             data['lat'] = this.lat.toJson();
//         }
//         if (this.lng != null) {
//             data['lng'] = this.lng.toJson();
//         }
//         if (this.voc_mpo_date != null) {
//             data['voc_mpo_date'] = this.voc_mpo_date.toJson();
//         }
//         return data;
//     }
// }
//
// class Division {
//     Object created_at;
//     int id;
//     String name;
//     Object updated_at;
//
//     Division({this.created_at, this.id, this.name, this.updated_at});
//
//     factory Division.fromJson(Map<String, dynamic> json) {
//         return Division(
//             created_at: json['created_at'] != null ? Object.fromJson(json['created_at']) : null,
//             id: json['id'],
//             name: json['name'],
//             updated_at: json['updated_at'] != null ? Object.fromJson(json['updated_at']) : null,
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['id'] = this.id;
//         data['name'] = this.name;
//         if (this.created_at != null) {
//             data['created_at'] = this.created_at.toJson();
//         }
//         if (this.updated_at != null) {
//             data['updated_at'] = this.updated_at.toJson();
//         }
//         return data;
//     }
// }
//
// class Thana {
//     Object created_at;
//     int district_id;
//     int division_id;
//     int id;
//     String name;
//     Object updated_at;
//
//     Thana({this.created_at, this.district_id, this.division_id, this.id, this.name, this.updated_at});
//
//     factory Thana.fromJson(Map<String, dynamic> json) {
//         return Thana(
//             created_at: json['created_at'] != null ? Object.fromJson(json['created_at']) : null,
//             district_id: json['district_id'],
//             division_id: json['division_id'],
//             id: json['id'],
//             name: json['name'],
//             updated_at: json['updated_at'] != null ? Object.fromJson(json['updated_at']) : null,
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['district_id'] = this.district_id;
//         data['division_id'] = this.division_id;
//         data['id'] = this.id;
//         data['name'] = this.name;
//         if (this.created_at != null) {
//             data['created_at'] = this.created_at.toJson();
//         }
//         if (this.updated_at != null) {
//             data['updated_at'] = this.updated_at.toJson();
//         }
//         return data;
//     }
// }