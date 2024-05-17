import 'package:get/get.dart';
import 'package:tiktok/modules/login/binding.dart';
import 'package:tiktok/modules/login/page.dart';
import 'package:tiktok/modules/main/binding.dart';
import 'package:tiktok/modules/main/page.dart';
import 'package:tiktok/modules/register/binding.dart';
import 'package:tiktok/modules/register/page.dart';
import 'package:tiktok/modules/reset_password/binding.dart';
import 'package:tiktok/modules/reset_password/page.dart';
import 'package:tiktok/modules/promotion/binding.dart';
import 'package:tiktok/modules/promotion/page.dart';
import 'package:tiktok/modules/withdrawal/binding.dart';
import 'package:tiktok/modules/withdrawal/page.dart';
import 'package:tiktok/route/route_path.dart';

abstract class AppPages {
  AppPages._();

  static final List<GetPage> routes = [
    GetPage(name: RoutePath.HOME_PAGE, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: RoutePath.LOGIN_PAGE, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(
        name: RoutePath.RESET_PASSWORD_PAGE, page: () => const ResetPasswordPage(), binding: ResetPasswordBinding()),
    GetPage(name: RoutePath.PROMOTION_PAGE, page: () => const PromotionPage(), binding: PromotionBinding()),
    GetPage(name: RoutePath.REGISTER_PAGE, page: () => const RegisterPage(), binding: RegisterBinding()),
    GetPage(name: RoutePath.WITHDRAWAL_PAGE, page: () => const WithdrawalPage(), binding: WithdrawalBinding()),
  ];
}
