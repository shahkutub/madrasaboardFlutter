class ApiClient {
  String api_token = '';
  //static String baseUrl = 'https://pvawg.brac.net/';
  static String baseUrl = 'http://nanoit.biz/project/ei/';

  static String login = '${baseUrl}api/login';
  static String alllocation = '${baseUrl}api/area_list';
  static String instituteTypeUrl = '${baseUrl}api/institute_type_list';
  static String allstudentUrl = 'http://202.72.235.218/survey_api/public/apiFirstPage/student122';

  static String sendInfo = '${baseUrl}api/FirstResponder';
}
