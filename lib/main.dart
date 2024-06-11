import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/route/app_pages.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:tiktok/utils/sp_util.dart';

import 'application.dart';
import 'modules/root/binding.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();

    await Application.getInstance().initApp();
    return launchApp();
  }, (Object error, StackTrace stack) {
    Log.d("");
  });
}

Future launchApp() async {
  /// 强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) async {
    runApp(const MyApp());

    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final builder = BotToastInit();

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ScreenUtilInit(
            designSize: const Size(414, 896),
            builder: (_, child) {
              return GetMaterialApp(
                  builder: (context, widget) {
                    return MediaQuery(
                        // 设置文字大小不随系统设置改变
                        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                        child: builder(context, widget));
                  },
                  navigatorObservers: [BotToastNavigatorObserver()],
                  title: 'Tiktok Speed Edition',
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  locale: const Locale("zh", "CH"),
                  supportedLocales: const [Locale.fromSubtags(languageCode: 'zh')],
                  localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
                    return locale;
                  },
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.black,
                      useMaterial3: true,
                      appBarTheme: const AppBarTheme(
                          systemOverlayStyle: SystemUiOverlayStyle.light,
                          iconTheme: IconThemeData(color: Colors.white),
                          elevation: 0,
                          centerTitle: true,
                          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                          backgroundColor: Colors.black),
                      dividerTheme: const DividerThemeData(color: Color(0xffe9e9e9)),
                      dividerColor: const Color(0xffe9e9e9)),
                  initialBinding: RootBinding(),
                  initialRoute: initialRoute,
                  getPages: AppPages.routes);
            }));
  }
}
