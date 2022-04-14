import 'package:get/get.dart';

import '../modules/create_rideoffer/bindings/create_rideoffer_binding.dart';
import '../modules/create_rideoffer/views/create_rideoffer_view.dart';
import '../modules/detail_rideoffer/bindings/detail_rideoffer_binding.dart';
import '../modules/detail_rideoffer/views/detail_rideoffer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_rideoffer/bindings/my_rideoffer_binding.dart';
import '../modules/my_rideoffer/views/my_rideoffer_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/requests_for_ride/bindings/requests_for_ride_binding.dart';
import '../modules/requests_for_ride/views/requests_for_ride_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_RIDEOFFER,
      page: () => CreateRideofferView(),
      binding: CreateRideofferBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RIDEOFFER,
      page: () => DetailRideofferView(),
      binding: DetailRideofferBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTS_FOR_RIDE,
      page: () => RequestsForRideView(),
      binding: RequestsForRideBinding(),
    ),
    GetPage(
      name: _Paths.MY_RIDEOFFER,
      page: () => MyRideofferView(),
      binding: MyRideofferBinding(),
    ),
  ];
}
