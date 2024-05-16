import 'package:get/get.dart';
import 'package:tiktok/modules/login/binding.dart';
import 'package:tiktok/modules/login/page.dart';
import 'package:tiktok/modules/main/binding.dart';
import 'package:tiktok/modules/main/page.dart';
import 'package:tiktok/modules/reset_password/binding.dart';
import 'package:tiktok/modules/reset_password/page.dart';
import 'package:tiktok/route/route_path.dart';

abstract class AppPages {
  AppPages._();

  static final List<GetPage> routes = [
    GetPage(name: RoutePath.HOME_PAGE, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: RoutePath.LOGIN_PAGE, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(
        name: RoutePath.RESET_PASSWORD_PAGE, page: () => const ResetPasswordPage(), binding: ResetPasswordBinding()),
  ];
}
