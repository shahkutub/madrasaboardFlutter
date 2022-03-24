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
      name: _Paths.INFORMATION_FORM,
      page: () => InformationFormView(),
      binding: InformationFormBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDED_DATA_LIST,
      page: () => ProvidedDataListView(),
      binding: ProvidedDataListBinding(),
    ),
  ];
}
