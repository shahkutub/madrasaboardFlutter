import 'dart:convert';

import 'package:brac_arna/app/api_providers/api_manager.dart';
import 'package:brac_arna/app/api_providers/api_url.dart';
import 'package:brac_arna/app/database_helper/offline_database_helper.dart';
import 'package:brac_arna/app/models/InspectionListREsponse.dart';
import 'package:brac_arna/app/models/InstituteSumaryResponse.dart';
import 'package:brac_arna/app/models/InstitutionDataModel.dart';
import 'package:brac_arna/app/models/InstitutionListResponse.dart';
import 'package:brac_arna/app/models/PostResponse.dart';
import 'package:brac_arna/app/models/SummaryPdf.dart';
import 'package:brac_arna/app/models/all_division_dis_thanan_model.dart';
import 'package:brac_arna/app/models/institute_sumary_list_response.dart';
import 'package:brac_arna/app/models/placeDataModel.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/ui.dart';
import '../models/AllStudentRessponse.dart';
import '../models/Inspection_model.dart';
import '../models/InspectorListResponse.dart';
import '../models/InstituteTypeModel.dart';
import '../routes/app_pages.dart';

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

  Future<InspectionListREsponse> getInspectionList(Map data) async {
    
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;

    var response;

    try {
      //  if (_connectionStatus == true) {
      var headers = {'Authorization': 'Bearer $token'};
      APIManager _manager = APIManager();


      response = await _manager.postAPICallWithHeader(ApiClient.inspectionList,data,headers);
      print('responseInspectionList: ${response}');

      String body = response.statusMessage;
      print(body);

      return InspectionListREsponse.fromJson(response);
      //} else {}


    } catch (error) {

      return InspectionListREsponse.fromJson(response);
      throw (error);
    }
  }


  Future<InspectionListREsponse> getInspectionListAll() async {

    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;

    var response;

    try {
      //  if (_connectionStatus == true) {
      var headers = {'Authorization': 'Bearer $token'};
      APIManager _manager = APIManager();


      response = await _manager.postAPICallWithHeaderWithoutParam(ApiClient.inspectionList,headers);
      print('responseInspectionList: ${response}');

      String body = response.statusMessage;
      print(body);

      return InspectionListREsponse.fromJson(response);
      //} else {}


    } catch (error) {

      return InspectionListREsponse.fromJson(response);
      throw (error);
    }
  }

  Future<PostResponse> postInspection(Inspection_model inspection_model, _connectionStatus) async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    //String? token = '';
    var year = DateTime.now().year;

    Map data = {
      'submit':inspection_model.submit.toString(),
      'inspector_id': inspection_model.inspector_id.toString(),
      'thana_id': inspection_model.thana_id.toString(),
      'district_id': inspection_model.district_id.toString(),
      'year': ""+year.toString(),
      'approval_date': ""+inspection_model.approval_date.toString(),
      'mpo_date': ""+inspection_model.mpo_date.toString(),
      'division_id': inspection_model.division_id.toString(),
      'class_inspection': inspection_model.shreniKarjo.toString(),
      'class_upgradation_suggestion': inspection_model.upgradationSuggession.toString(),
      'cleaning_steps': ""+inspection_model.isCleanness.toString(),
      'cocurricular_activities': ""+inspection_model.co_caricolum.toString(),
      'comments': ""+inspection_model.comments.toString(),
      'week_studuents_activities': ""+inspection_model.week_studuents_activities.toString(),
      'covid19_vaccinated': ""+inspection_model.covid19_vaccinated.toString(),
      'electricity_facility': ""+inspection_model.electricity_facility.toString(),
      'first_aid_description': ""+inspection_model.isPrymariHealth.toString(),
      'guardian_gathering': ""+inspection_model.guardian_gathering.toString(),
      'headmaster_mobile_no': ""+inspection_model.headmaster_mobile_no.toString(),
      'district_id': inspection_model.district_id.toString(),
      'thana_id': inspection_model.thana_id.toString(),
      'institute_type': ""+inspection_model.institute_type.toString(),
      'institute_id': ""+inspection_model.institute_id.toString(),


      'electricity_facility': ""+inspection_model.electricity_facility.toString(),
      'teacher_training': ""+inspection_model.isOtherTraining.toString(),
      'ict_training': ""+inspection_model.isIctTraining.toString(),
      'internet_facility': ""+inspection_model.internet_facility.toString(),
      'total_multimedia_classroom': ""+inspection_model.total_multimedia_classroom.toString(),
      'total_digital_lab': ""+inspection_model.total_digital_lab.toString(),
      'total_girls_students': ""+inspection_model.total_girls_students.toString(),
      'total_students': ""+inspection_model.total_students.toString(),
      //'institute_id': ""+inspection_model.institute_id.toString(),
      'institute_type': ""+inspection_model.institute_type.toString(),
      'total_teachers': ""+inspection_model.total_teachers.toString(),
      'total_women_teachers': ""+inspection_model.total_women_teachers.toString(),
      'total_passed': ""+inspection_model.total_passed.toString(),
      'total_examinees': ""+inspection_model.total_examine.toString(),
      'overall_status': ""+inspection_model.overall_status.toString(),
      'soft_skill_description': ""+inspection_model.soft_skill.toString(),
      'mental_health_activities': ""+inspection_model.mentalHealthActivity.toString(),
      'cocurricular_activities': ""+inspection_model.cocurricular_activities.toString(),


      // 'year': ""+year.toString(),
      // 'division_id': inspection_model.division_id.toString(),
      // 'district_id': inspection_model.district_id.toString(),
      // 'thana_id': inspection_model.thana_id.toString(),
      // 'institute_type': ""+inspection_model.institute_type.toString(),
      // 'institute_id': ""+inspection_model.institute_id.toString(),
      // '': ""+inspection_model.eiinNumber.toString(),
      //
      // '': ""+inspection_model.inspectorName.toString(),
      // '': ""+inspection_model.inspectorPost.toString(),
      // '': ""+inspection_model.inspectorMobile.toString(),
      // '': ""+inspection_model.inspectorEmail.toString(),
      // '': ""+inspection_model.inspectionDate.toString(),


      'headmaster_name': ""+inspection_model.headmaster_name.toString(),
      'inspector_name': ""+inspection_model.inspectorName.toString(),
      //'headmaster_mobile_no': ""+inspection_model.headmaster_mobile_no.toString(),
      // '': ""+inspection_model.institute_permited_post.toString(),
      // '': ""+inspection_model.headmaster_post.toString(),
      // 'total_teachers': ""+inspection_model.total_teachers.toString(),
      // 'total_women_teachers': ""+inspection_model.total_women_teachers.toString(),
      // '': ""+inspection_model.total_songjukto_teachers.toString(),
      // '': ""+inspection_model.present_teacher.toString(),
      // '': ""+inspection_model.abcent_teacher.toString(),
      // '': ""+inspection_model.isFormalDress.toString(),
      // '': ""+inspection_model.isIctTraining.toString(),
      // '': ""+inspection_model.isOtherTraining.toString(),
      // '': ""+inspection_model.empty_post.toString(),
      // 'total_students': ""+inspection_model.total_students.toString(),
      // 'total_girls_students': ""+inspection_model.total_girls_students.toString(),
      // '': ""+inspection_model.special_needs_students.toString(),
      // '': ""+inspection_model.cholarship_students.toString(),


      // '': ""+inspection_model.dakhilExamine_students.toString(),
      // '': ""+inspection_model.alimExamine_students.toString(),
      // '': ""+inspection_model.fazilExamine_students.toString(),
      // '': ""+inspection_model.kamilExamine_students.toString(),
      // '': ""+inspection_model.vokExamine_students.toString(),
      // '': ""+inspection_model.bmetExamine_students.toString(),
      // '': ""+inspection_model.deplomaEngExamine_students.toString(),
      // '': ""+inspection_model.shortExamine_students.toString(),

      // '': ""+inspection_model.dakhilPass_students.toString(),
      // '': ""+inspection_model.alimPass_students.toString(),
      // '': ""+inspection_model.fazilPass_students.toString(),
      // '': ""+inspection_model.kamilPass_students.toString(),
      // '': ""+inspection_model.vokPass_students.toString(),
      // '': ""+inspection_model.bmetPass_students.toString(),
      // '': ""+inspection_model.deplomaEngPass_students.toString(),
      // '': ""+inspection_model.shortPass_students.toString(),


      // '': ""+inspection_model.recognise_date.toString(),
      // '': ""+inspection_model.mpo_date.toString(),
      // 'electricity_facility': ""+inspection_model.electricity_facility.toString(),
      // 'internet_facility': ""+inspection_model.internet_facility.toString(),
      // 'total_multimedia_classroom': ""+inspection_model.total_multimedia_classroom.toString(),
      // 'total_digital_lab': ""+inspection_model.total_digital_lab.toString(),
      // '': ""+inspection_model.isSkrLab.toString(),
      // '': ""+inspection_model.isOnlineClass.toString(),
      // '': ""+inspection_model.isCleanness.toString(),
      // '': ""+inspection_model.isCachmant.toString(),
      // '': ""+inspection_model.isRegisok.toString(),
      // '': ""+inspection_model.isWeekWork.toString(),
      // '': ""+inspection_model.isPrymariHealth.toString(),
      // '': ""+inspection_model.guardian_gathering.toString(),
      // '': ""+inspection_model.toiletClean.toString(),
      // '': ""+inspection_model.safeWater.toString(),
      // '': ""+inspection_model.tree.toString(),
      // '': ""+inspection_model.cleanDress.toString(),
      // '': ""+inspection_model.mentalHealthActivity.toString(),
      // '': ""+inspection_model.covid19_vaccinated.toString(),
      // '': ""+inspection_model.yearlyPlan.toString(),
      // '': ""+inspection_model.shreniKarjo.toString(),
      // '': ""+inspection_model.upgradationSuggession.toString(),
      // '': ""+inspection_model.previousInspetion.toString(),
      // '': ""+inspection_model.previousInspetionApply.toString(),
      // '': ""+inspection_model.comments.toString(),






    };
    print('Savedatd'+jsonEncode(data).toString());
    var response;
    try {
    //  if (_connectionStatus == true) {
        var headers = {'Authorization': 'Bearer $token'};
        APIManager _manager = APIManager();


        response = await _manager.postAPICallWithHeader(ApiClient.postInspectionUrl, data, headers);
        print('response: ${response}');

        if(response == null){
          Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication Expired, Please login'.tr, title: 'Error'.tr));

          Get.toNamed(Routes.LOGIN);
          //Get.offNamed(Routes.LOGIN);
        }

        String body = response.statusMessage;
        print(body);

        return PostResponse.fromJson(response);
      //} else {}


    } catch (error) {

      return PostResponse.fromJson(response);
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

      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication Expired, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }

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
      Get.toNamed(Routes.LOGIN);
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

  Future<InspectorListResponse> getInsPectorList() async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.inspector_list,headers);
      print('respInstiTyp: ${response}');

      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication Expired, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }
      return InspectorListResponse.fromJson(response);
      // return all_division_dis_thanan_model().fromJson(response);
      //  if (response['IsLoggedIn'] == true) {
      //    Get.find<AuthService>().setUser(UserModel.fromJson(response));
      //    return all_division_dis_thanan_model.fromJson(response);
      //  } else {
      //    return 'Unauthorised';
      //  }
    } catch (e) {
      print('error:$e');
      return InspectorListResponse.fromJson(response);
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

      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication Expired, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }
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
      response = await _manager.get(ApiClient.baseUrl+"api/institute_list?division_id="+divId+"&district_id="+disId+"&thana_id="+thanaId+"&institute_type_id="+insTypeId,headers);
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


  Future<InstitutionDataModel> getInstituteAll() async {
    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get("http://ei.nanoit.biz/api/institute_list",headers);
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

  Future instituteSumary(String education_id,String division_id,String district_id,String thana_id,String institute_type_id,String institute_id) async {

    Map param = {
      'education_id': education_id,
      'division_id': division_id,
      'district_id': district_id,
      'thana_id': thana_id,
      'institute_type': institute_type_id,
      'institute_id': institute_id,
    };

    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICallbodyheader(ApiClient.institutesummary,param,headers);
      print('response: ${response}');

      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication failed, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }
      if (response != null) {
       // instituteSummary.value = response;
       // print('instituteSummary.value: ${instituteSummary.value.api_info!.total_examinees.toString()}');
        return InstituteSumaryResponse.fromJson(response);
      } else {
        return 'Unauthorised';
      }
    } catch (e) {
      print('error:$e');
      return 'Unauthorised';
    }
  }

  Future <institute_sumary_list_response> instituteListSumaryBased(String url_last,String education_id,String division_id,String district_id,String thana_id,String institute_type_id,String institute_id,String page) async {

    Map param = {
      'education_id': education_id,
      'division_id': division_id,
      'district_id': district_id,
      'thana_id': thana_id,
      'institute_type': institute_type_id,
      'institute_id': institute_id,
      'page': page,
    };

    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICallbodyheader(ApiClient.instituteListsummaryBased+url_last.toString(),param,headers);
      print('response: ${response}');

      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication failed, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }

      if (response != null) {
        // instituteSummary.value = response;
        // print('instituteSummary.value: ${instituteSummary.value.api_info!.total_examinees.toString()}');
        return institute_sumary_list_response.fromJson(response);
      } else {
        return institute_sumary_list_response.fromJson(response);
      }
    } catch (e) {
      return institute_sumary_list_response.fromJson(response);
    }
  }



  Future instituteSumaryPdf(String education_id,String division_id,String district_id,String thana_id,String institute_type_id,String institute_id) async {

    Map param = {
      'education_id': education_id,
      'division_id': division_id,
      'district_id': district_id,
      'thana_id': thana_id,
      'institute_type': institute_type_id,
      'institute_id': institute_id,
    };

    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICallbodyheader(ApiClient.institutesummaryPdf,param,headers);
      print('response: ${response}');
      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication failed, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }
      if (response != null) {
        // instituteSummary.value = response;
        // print('instituteSummary.value: ${instituteSummary.value.api_info!.total_examinees.toString()}');
        return SummaryPdf.fromJson(response);
      } else {
        return 'Unauthorised';
      }
    } catch (e) {
      print('error:$e');
      return 'Unauthorised';
    }
  }



  Future instituteListPdf(String division_id,String district_id,String thana_id,String institute_type_id,String institute_id,String urlLast) async {

    Map param = {
      'division_id': division_id,
      'district_id': district_id,
      'thana_id': thana_id,
      'institute_type': institute_type_id,
      'institute_id': institute_id,
    };

    String? token = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
    var headers = {'Authorization': 'Bearer $token'};
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICallbodyheader('http://nanoit.biz/project/ei/api/institute-summary-details/pdf/'+urlLast,param,headers);
      print('response: ${response}');
      if(response == null){
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Authentication failed, Please login'.tr, title: 'Error'.tr));

        Get.toNamed(Routes.LOGIN);
      }
      if (response != null) {
        // instituteSummary.value = response;
        // print('instituteSummary.value: ${instituteSummary.value.api_info!.total_examinees.toString()}');
        return response;
      } else {
        return 'Unauthorised';
      }
    } catch (e) {
      print('error:$e');
      return 'Unauthorised';
    }
  }



}
