import 'package:get/get.dart';
import 'package:tiktok/modules/main/binding.dart';
import 'package:tiktok/modules/main/page.dart';
import 'package:tiktok/route/route_path.dart';

abstract class AppPages {
  AppPages._();

  static final List<GetPage> routes = [
    GetPage(name: RoutePath.HOME_PAGE, page: () => const MainPage(), binding: MainBinding()),
  ];
}
