import 'dart:convert';

import 'package:brac_arna/app/api_providers/api_manager.dart';
import 'package:brac_arna/app/api_providers/api_url.dart';
import 'package:brac_arna/app/database_helper/offline_database_helper.dart';
import 'package:brac_arna/app/models/InstitutionDataModel.dart';
import 'package:brac_arna/app/models/all_division_dis_thanan_model.dart';
import 'package:brac_arna/app/models/placeDataModel.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/AllStudentRessponse.dart';
import '../models/Inspection_model.dart';
import '../models/InstituteTypeModel.dart';

class InformationRepository {
  final dbHelper = DatabaseHelper.instance;

  Future addName(data, _connectionStatus) async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    print(data.toString());
    int a = 1;
    print(_connectionStatus.toString());
    try {
      if (_connectionStatus == true) {
        APIManager _manager = APIManager();
        var response;
        var headers = {'Authorization': 'Bearer $token'};

        response = await _manager.postAPICallWithHeader(ApiClient.login, data, headers);
        print('response: ${response}');

        String body = response.statusMessage;
        print(body);
        Map<String, dynamic> row = {
          DatabaseHelper.columnName: data.toString(),
          DatabaseHelper.status: 1,
        };
        await dbHelper.insert(row);

        // Response response = await Dio().post(
        //   'http://192.168.42.175/SqliteSync/saveName.php',
        //   options: Options(headers: {
        //     HttpHeaders.contentTypeHeader: "application/json",
        //   }),
        //   data: jsonEncode(<String, dynamic>{"name": text.toString(), "status": a}),
        // );
        //
        // if (response.statusCode == 200) {
        //   String body = response.statusMessage;
        //   print(body);
        //   Map<String, dynamic> row = {
        //     DatabaseHelper.columnName: text.toString(),
        //     DatabaseHelper.status: 1,
        //   };
        //   await dbHelper.insert(row);
        // } else {
        //   print('Request failed with status: ${response.statusCode}.');
        // }
      } else {
        Map<String, dynamic> row = {
          DatabaseHelper.columnName: data.toString(),
          DatabaseHelper.status: 0,
        };
        final id = await dbHelper.insert(row);
        print('inserted row id: $id');
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<void> sync(data, _connectionStatus) async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    print(data.toString());
    int a = 1;
    print(_connectionStatus.toString());
    try {
      if (_connectionStatus == true) {
        var headers = {'Authorization': 'Bearer $token'};
        APIManager _manager = APIManager();
        var response;

        response = await _manager.postAPICallWithHeader(ApiClient.login, data, headers);
        print('response: ${response}');

        String body = response.statusMessage;
        print(body);
      } else {}
    } catch (error) {
      throw (error);
    }
  }

  Future<void> postInspection(Inspection_model inspection_model, _connectionStatus) async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    Map data = {

      'thana_id': inspection_model.thana_id.toString(),
      'district_id': inspection_model.district_id.toString(),
      'division_id': inspection_model.division_id.toString(),
      'class_inspection': ""+inspection_model.class_inspection.toString(),
      'class_upgradation_suggestion': ""+inspection_model.class_upgradation_suggestion.toString(),
      'cleaning_steps': ""+inspection_model.cleaning_steps.toString(),
      'cocurricular_activities': ""+inspection_model.cocurricular_activities.toString(),
      'comments': ""+inspection_model.comments.toString(),
      'covid19_vaccinated': ""+inspection_model.covid19_vaccinated.toString(),
      'electricity_facility': ""+inspection_model.electricity_facility.toString(),
      'first_aid_description': ""+inspection_model.first_aid_description.toString(),
      'guardian_gathering': ""+inspection_model.guardian_gathering.toString(),
      'headmaster_mobile_no': ""+inspection_model.headmaster_mobile_no.toString(),
      'mental_health_activities': ""+inspection_model.mental_health_activities.toString(),
      'week_studuents_activities': ""+inspection_model.week_studuents_activities.toString(),
      'online_class': ""+inspection_model.online_class.toString(),
      'cleaning_steps': ""+inspection_model.cleaning_steps.toString(),
      'ict_training': ""+inspection_model.ict_training.toString(),
      'electricity_facility': ""+inspection_model.electricity_facility.toString(),
      'teacher_training': ""+inspection_model.teacher_training.toString(),
      'internet_facility': ""+inspection_model.internet_facility.toString(),
      'total_multimedia_classroom': ""+inspection_model.total_multimedia_classroom.toString(),
      'total_girls_students': ""+inspection_model.total_girls_students.toString(),
      'total_students': ""+inspection_model.total_students.toString(),
      'institute_id': ""+inspection_model.institute_id.toString(),
      'total_teachers': ""+inspection_model.total_teachers.toString(),
      'year': "2022",
    };
    print(_connectionStatus.toString());
    try {
      if (_connectionStatus == true) {
        var headers = {'Authorization': 'Bearer $token'};
        APIManager _manager = APIManager();
        var response;

        response = await _manager.postAPICallWithHeader(ApiClient.postInspectionUrl, data, headers);
        print('response: ${response}');

        String body = response.statusMessage;
        print(body);
      } else {}
    } catch (error) {
      throw (error);
    }
  }

  Future<PlaceDataModel> readLocationJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('assets/place/users.json');
    //decode json data as list
    final list = json.decode(jsondata);

    print(list);

    return PlaceDataModel.fromJson(list);
  }

  Future<all_division_dis_thanan_model> getDivDisThana() async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.alllocation,headers);
      print('responseAllDivDis: ${response}');

      return all_division_dis_thanan_model.fromJson(response);
     // return all_division_dis_thanan_model().fromJson(response);
     //  if (response['IsLoggedIn'] == true) {
     //    Get.find<AuthService>().setUser(UserModel.fromJson(response));
     //    return all_division_dis_thanan_model.fromJson(response);
     //  } else {
     //    return 'Unauthorised';
     //  }
    } catch (e) {
      print('error:$e');
      return all_division_dis_thanan_model.fromJson(response);
    }
  }


  Future<AllStudentRessponse> getAllStudent() async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.allstudentUrl,headers);
      print('responseAllstudent: ${response}');

      return AllStudentRessponse.fromJson(response);
      // return all_division_dis_thanan_model().fromJson(response);
      //  if (response['IsLoggedIn'] == true) {
      //    Get.find<AuthService>().setUser(UserModel.fromJson(response));
      //    return all_division_dis_thanan_model.fromJson(response);
      //  } else {
      //    return 'Unauthorised';
      //  }
    } catch (e) {
      print('error:$e');
      return AllStudentRessponse.fromJson(response);
    }
  }



  Future<InstituteTypeModel> getInstituteType() async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.instituteTypeUrl,headers);
      print('respInstiTyp: ${response}');

      return InstituteTypeModel.fromJson(response);
      // return all_division_dis_thanan_model().fromJson(response);
      //  if (response['IsLoggedIn'] == true) {
      //    Get.find<AuthService>().setUser(UserModel.fromJson(response));
      //    return all_division_dis_thanan_model.fromJson(response);
      //  } else {
      //    return 'Unauthorised';
      //  }
    } catch (e) {
      print('error:$e');
      return InstituteTypeModel.fromJson(response);
    }
  }

  Future<InstitutionDataModel> getInstitute(String divId,String disId,String thanaId,String insTypeId) async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get("http://ei.nanoit.biz/api/institute_list?division_id="+divId+"&district_id="+disId+"&thana_id="+thanaId+"&institute_type_id="+insTypeId,headers);
      print('respInstiTyp: ${response}');

      return InstitutionDataModel.fromJson(response);
      // return all_division_dis_thanan_model().fromJson(response);
      //  if (response['IsLoggedIn'] == true) {
      //    Get.find<AuthService>().setUser(UserModel.fromJson(response));
      //    return all_division_dis_thanan_model.fromJson(response);
      //  } else {
      //    return 'Unauthorised';
      //  }
    } catch (e) {
      print('error:$e');
      return InstitutionDataModel.fromJson(response);
    }
  }

}
