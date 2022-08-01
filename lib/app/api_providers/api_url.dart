class ApiClient {
  String api_token = '';
  //static String baseUrl = 'https://pvawg.brac.net/';
  //static String baseUrl = 'http://nanoit.biz/project/ei/';
  //static String baseUrl = 'http://nanoit.biz/project/ei/';
  static String baseUrl = '192.168.68.133/ei/';

  static String login = '${baseUrl}api/login';
  static String institutesummary = '${baseUrl}api/institute-summary';
  static String instituteListsummaryBased = '${baseUrl}api/institute-summary-details/html/';
  static String institutesummaryPdf = '${baseUrl}api/institute-summary/pdf';
  static String instituteListPdf = '${baseUrl}api/institute-summary/pdf';
  static String allproducts_v3 = 'https://medicineadmin.binaryhub360.com/public/api/all-products_v3';
  static String alllocation = '${baseUrl}api/area_list';
  static String instituteTypeUrl = '${baseUrl}api/institute_type_list';
  static String allstudentUrl = 'http://202.72.235.218/survey_api/public/apiFirstPage/student122';
  static String postInspectionUrl = '${baseUrl}api/save-inspection';
  static String inspectionList = '${baseUrl}api/inspection_list';
  static String sendInfo = '${baseUrl}api/FirstResponder';
}
