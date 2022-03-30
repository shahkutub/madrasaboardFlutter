import 'package:brac_arna/app/models/District.dart';
import 'package:brac_arna/app/models/Division.dart';
import 'package:brac_arna/app/models/Thana.dart';

class Inspection {
    String? approval_date;
    String? class_inspection;
    String? class_upgradation_suggestion;
    String? cleaning_steps;
    String? cocurricular_activities;
    String? comments;
    String? covid19_vaccinated;
    String? created_at;
    //District? district;
    int? district_id;
    String? district_name;
    //Division? division;
    int? division_id;
    String? division_name;
    int? electricity_facility;
    String? first_aid_description;
    int? guardian_gathering;
    String? headmaster_mobile_no;
    String? headmaster_name;
    String? ict_training;
    int? id;
    int? inspector_id;
    int? institute_id;
    int? institute_type;
    String? institution_name;
    int? internet_facility;
    String? mental_health_activities;
    String? mpo_date;
    int? online_class;
    String? overall_status;
    String? soft_skill_description;
    int? teacher_training;
    //Thana? thana;
    int? thana_id;
    String? thana_name;
    int? total_digital_lab;
    int? total_examinees;
    int? total_girls_students;
    int? total_multimedia_classroom;
    int? total_passed;
    int? total_students;
    int? total_teachers;
    int? total_women_teachers;
    String? updated_at;
    String? week_studuents_activities;
    String? details_url;
    int? year;

    Inspection({this.approval_date, this.class_inspection, this.class_upgradation_suggestion, this.cleaning_steps, this.cocurricular_activities, this.comments, this.covid19_vaccinated, this.created_at, this.district_id, this.district_name,  this.division_id, this.division_name, this.electricity_facility, this.first_aid_description, this.guardian_gathering, this.headmaster_mobile_no, this.headmaster_name, this.ict_training, this.id, this.inspector_id, this.institute_id, this.institute_type, this.institution_name, this.internet_facility, this.mental_health_activities, this.mpo_date, this.online_class, this.overall_status, this.soft_skill_description, this.teacher_training,  this.thana_id, this.thana_name, this.total_digital_lab, this.total_examinees, this.total_girls_students, this.total_multimedia_classroom, this.total_passed, this.total_students, this.total_teachers, this.total_women_teachers, this.updated_at, this.week_studuents_activities,this.details_url, this.year});

    factory Inspection.fromJson(Map<String, dynamic> json) {
        return Inspection(
            approval_date: json['approval_date'], 
            class_inspection: json['class_inspection'],
            class_upgradation_suggestion: json['class_upgradation_suggestion'],
            cleaning_steps: json['cleaning_steps'],
            cocurricular_activities: json['cocurricular_activities'] ,
            comments: json['comments'] ,
            covid19_vaccinated: json['covid19_vaccinated'] ,
            created_at: json['created_at'], 
            district_id: json['district_id'],
            district_name: json['district_name'], 
            division_id: json['division_id'],
            division_name: json['division_name'], 
            electricity_facility: json['electricity_facility'], 
            first_aid_description: json['first_aid_description'] ,
            guardian_gathering: json['guardian_gathering'], 
            headmaster_mobile_no: json['headmaster_mobile_no'] ,
            headmaster_name: json['headmaster_name'] ,
            ict_training: json['ict_training'] ,
            id: json['id'], 
            inspector_id: json['inspector_id'], 
            institute_id: json['institute_id'], 
            institute_type: json['institute_type'], 
            institution_name: json['institution_name'], 
            internet_facility: json['internet_facility'], 
            mental_health_activities: json['mental_health_activities'],
            mpo_date: json['mpo_date'], 
            online_class: json['online_class'], 
            overall_status: json['overall_status'] ,
            soft_skill_description: json['soft_skill_description'] ,
            teacher_training: json['teacher_training'], 
            thana_id: json['thana_id'],
            thana_name: json['thana_name'], 
            total_digital_lab: json['total_digital_lab'], 
            total_examinees: json['total_examinees'], 
            total_girls_students: json['total_girls_students'], 
            total_multimedia_classroom: json['total_multimedia_classroom'] ,
            total_passed: json['total_passed'], 
            total_students: json['total_students'], 
            total_teachers: json['total_teachers'], 
            total_women_teachers: json['total_women_teachers'], 
            updated_at: json['updated_at'], 
            week_studuents_activities: json['week_studuents_activities'] ,
            details_url: json['details_url'] ,
            year: json['year'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['approval_date'] = this.approval_date;
        data['created_at'] = this.created_at;
        data['district_id'] = this.district_id;
        data['district_name'] = this.district_name;
        data['division_id'] = this.division_id;
        data['division_name'] = this.division_name;
        data['electricity_facility'] = this.electricity_facility;
        data['guardian_gathering'] = this.guardian_gathering;
        data['id'] = this.id;
        data['inspector_id'] = this.inspector_id;
        data['institute_id'] = this.institute_id;
        data['institute_type'] = this.institute_type;
        data['institution_name'] = this.institution_name;
        data['internet_facility'] = this.internet_facility;
        data['mpo_date'] = this.mpo_date;
        data['online_class'] = this.online_class;
        data['teacher_training'] = this.teacher_training;
        data['thana_id'] = this.thana_id;
        data['thana_name'] = this.thana_name;
        data['total_digital_lab'] = this.total_digital_lab;
        data['total_examinees'] = this.total_examinees;
        data['total_girls_students'] = this.total_girls_students;
        data['total_passed'] = this.total_passed;
        data['total_students'] = this.total_students;
        data['total_teachers'] = this.total_teachers;
        data['total_women_teachers'] = this.total_women_teachers;
        data['updated_at'] = this.updated_at;
        data['details_url'] = this.details_url;
        data['year'] = this.year;

        return data;
    }
}