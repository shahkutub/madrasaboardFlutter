import 'package:brac_arna/app/modules/login/views/after_login_view.dart';
import 'package:brac_arna/app/modules/provided_data_list/views/inspection_report_pdf_view.dart';
import 'package:brac_arna/app/modules/provided_data_list/views/single_inspection_form_view.dart';
import 'package:get/get.dart';

import 'package:brac_arna/app/modules/InformationForm/bindings/information_form_binding.dart';
import 'package:brac_arna/app/modules/InformationForm/views/information_form_view.dart';
import 'package:brac_arna/app/modules/home/bindings/home_binding.dart';
import 'package:brac_arna/app/modules/home/views/home_view.dart';
import 'package:brac_arna/app/modules/login/bindings/login_binding.dart';
import 'package:brac_arna/app/modules/login/views/login_view.dart';
import 'package:brac_arna/app/modules/provided_data_list/bindings/provided_data_list_binding.dart';
import 'package:brac_arna/app/modules/provided_data_list/views/provided_data_list_view.dart';
import 'package:brac_arna/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:brac_arna/app/modules/splashscreen/views/splashscreen_view.dart';

import '../modules/geo_location/bindings/geo_location_binding.dart';
import '../modules/geo_location/views/geo_location_view.dart';
import '../modules/institute_search/bindings/general_search_binding.dart';
import '../modules/institute_search/bindings/institute_search_binding.dart';
import '../modules/institute_search/views/general_search_view.dart';
import '../modules/institute_search/views/institute_search_list_view.dart';
import '../modules/login/bindings/after_login_binding.dart';
import '../modules/provided_data_list/bindings/single_inspectionView.dart';
import '../modules/provided_data_list/bindings/single_inspectionView_pdf.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.AFTER_LOGIN,
      page: () => AfterLoginView(),
      binding: AfterLoginBinding(),
    ),


    GetPage(
      name: _Paths.INFORMATION_FORM,
      page: () => InformationFormView(),
      binding: InformationFormBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDED_DATA_LIST,
      page: () => ProvidedDataListView(),
      binding: ProvidedDataListBinding(),
    ),

    GetPage(
      name: _Paths.SINGLE_INSPECTION_VIEW,
      page: () => single_inspection_form_view(),
      binding: single_inspectionView(),
    ),

    GetPage(
      name: _Paths.SINGLE_INSPECTION_VIEW_PDF,
      page: () => InspectionReportPDFView(),
      binding: single_inspectionViewPdf(),
    ),
    GetPage(
      name: _Paths.INSTITUTE_SEARCH,
      page: () => institute_search_list_view(),
      binding: institute_search_binding(),
    ),


    GetPage(
      name: _Paths.GENERAL_SEARCH,
      page: () => general_search_view(),
      binding: general_search_binding(),
    ),

    GetPage(
      name: _Paths.GEO_LOCATION,
      page: () => GeoLocationView(),
      binding: GeoLocationBinding(),
    ),

  ];
}
