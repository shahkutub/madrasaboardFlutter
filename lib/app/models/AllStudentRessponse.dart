import 'package:brac_arna/app/models/Student.dart';

class AllStudentRessponse {
    List<Student>? students;

    AllStudentRessponse({this.students});

    factory AllStudentRessponse.fromJson(Map<String, dynamic> json) {
        return AllStudentRessponse(
            students: json['students'] != null ? (json['students'] as List).map((i) => Student.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.students != null) {
            data['students'] = this.students?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}