import 'package:brac_arna/app/models/ApiInfo.dart';

class LoginResponse {
    ApiInfo? api_info;
    String? message;
    String? status;

    LoginResponse({this.api_info, this.message, this.status});

    factory LoginResponse.fromJson(Map<String, dynamic> json) {
        return LoginResponse(
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
            data['api_info'] = this.api_info?.toJson();
        }
        return data;
    }
}