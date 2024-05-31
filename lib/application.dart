import 'package:tiktok/utils/sp_util.dart';

import 'route/route_path.dart';

String initialRoute = RoutePath.HOME_PAGE;

class Application {
  static Application? instance;

  static Application getInstance() {
    instance ??= Application();
    return instance!;
  }

  Future<void> initApp() async {
    String token = SpUtil.getString("_TOKEN_", defValue: "");

    if (token.isEmpty) {
      initialRoute = RoutePath.LOGIN_PAGE;
    } else {
      initialRoute = RoutePath.HOME_PAGE;
    }
  }
}
