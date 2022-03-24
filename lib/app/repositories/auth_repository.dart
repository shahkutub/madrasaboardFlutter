import 'package:brac_arna/app/api_providers/api_manager.dart';
import 'package:brac_arna/app/api_providers/api_url.dart';
import 'package:brac_arna/app/models/LoginResponse.dart';
import 'package:brac_arna/app/models/user_model.dart';
import 'package:brac_arna/app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthRepository {
  ///User Login api call
  Future userLogin(UserModel userData) async {
    Map user = {
      'email': userData.userName,
      'password': userData.password,
    };
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.postAPICall(ApiClient.login, user);
      print('response: ${response}');

      if (response != null) {
        //Get.find<AuthService>().setUser(LoginResponse.fromJson(response));
        return LoginResponse.fromJson(response);
      } else {
        return 'Unauthorised';
      }
    } catch (e) {
      print('error:$e');
      return 'Unauthorised';
    }
  }
}