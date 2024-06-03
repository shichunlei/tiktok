import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:tiktok/global/config.dart';
import 'package:tiktok/global/keys.dart';
import 'package:tiktok/route/route_path.dart';
import 'package:tiktok/utils/sp_util.dart';

import 'log_utils.dart';

class HttpUtils {
  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String DELETE = 'delete';

  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  Dio? _dio;

  static final HttpUtils _instance = HttpUtils._internal();

  factory HttpUtils() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpUtils._internal() {
    if (null == _dio) {
      _dio = Dio(BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(milliseconds: CONNECT_TIMEOUT),
          receiveTimeout: const Duration(milliseconds: RECEIVE_TIMEOUT)));

      /// 添加拦截器
      _dio!.interceptors.add(HeaderInterceptor());

      if (kDebugMode) {
        _dio!.interceptors.add(TalkerDioLogger(
            settings: TalkerDioLoggerSettings(
                printRequestHeaders: true,
                printResponseHeaders: false,
                printResponseMessage: false,
                requestPen: AnsiPen()..blue(),
                responsePen: AnsiPen()..green(),
                errorPen: AnsiPen()..red())));
      }
    }
  }

  static HttpUtils getInstance({String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  /// 用于指定特定域名
  HttpUtils _baseUrl(String baseUrl) {
    if (_dio != null) _dio!.options.baseUrl = baseUrl;

    return this;
  }

  /// 一般请求，默认域名
  HttpUtils _normal() {
    if (_dio != null && _dio!.options.baseUrl != AppConfig.baseUrl) {
      _dio!.options.baseUrl = AppConfig.baseUrl;
    }
    return this;
  }

  /// Make http request with options.
  ///
  /// [method] The request method.
  /// [path] The url path.
  /// [params] The request data
  ///
  /// String 返回 json data .
  Future request(String path,
      {Map<String, dynamic> params = const {}, String method = POST, String contentType = "application/json"}) async {
    try {
      String token = SpUtil.getString("_TOKEN_", defValue: "");

      Response response = await _dio!.request(path,
          data: params,
          queryParameters: params,
          options: Options(method: method, headers: {"contentType": contentType, "authorization": token}));

      if (response.statusCode == 200) {
        if (response.data["code"] == 40003 || response.data["code"] == 40005) {
          // 请求携带的 token 令牌过期 / 登录过期
          SpUtil.remove("_TOKEN_");
          Get.offAllNamed(RoutePath.LOGIN_PAGE);
        }

        return response.data;
      } else {
        return {"msg": "请求发生错误", "code": -1};
      }
    } on DioException catch (error) {
      /// 响应信息, 如果错误发生在服务器返回数据之前，它为 `null`
      Log.d('$method请求发生错误：${error.toString()}');

      return formatError(error);
    }
  }

  /// error统一处理
  Map<String, dynamic> formatError(DioException error) {
    Log.d("${error.message}-------------------------------------------------${error.error}");
    if (error.type == DioExceptionType.connectionTimeout) {
      // It occurs when url is opened timeout.
      Log.d("连接超时 Ծ‸ Ծ");
      return {Keys.MSG: "连接超时 Ծ‸ Ծ", Keys.CODE: 100};
    } else if (error.type == DioExceptionType.sendTimeout) {
      // It occurs when url is sent timeout.
      Log.d("请求超时 Ծ‸ Ծ");
      return {Keys.MSG: "请求超时 Ծ‸ Ծ", Keys.CODE: 101};
    } else if (error.type == DioExceptionType.receiveTimeout) {
      //It occurs when receiving timeout
      Log.d("响应超时 Ծ‸ Ծ");
      return {Keys.MSG: "响应超时 Ծ‸ Ծ", Keys.CODE: 102};
    } else if (error.type == DioExceptionType.badResponse) {
      // When the server response, but with a incorrect status, such as 404, 503...
      int? errCode = error.response?.statusCode;
      switch (errCode) {
        case 400:
          return error.response?.data;
        case 401:
          return {Keys.MSG: "没有权限 Ծ‸ Ծ", Keys.CODE: 401};
        case 403:
          return {Keys.MSG: "服务器拒绝执行 Ծ‸ Ծ", Keys.CODE: 403};
        case 404:
          return {Keys.MSG: "无法连接服务器 Ծ‸ Ծ", Keys.CODE: 404};
        case 405:
          return {Keys.MSG: "请求方法被禁止 Ծ‸ Ծ", Keys.CODE: 405};
        case 500:
          return {Keys.MSG: "服务器内部错误 Ծ‸ Ծ", Keys.CODE: 500};
        case 502:
          return {Keys.MSG: "无效请求 Ծ‸ Ծ", Keys.CODE: 502};
        case 503:
          return {Keys.MSG: "服务器异常 Ծ‸ Ծ", Keys.CODE: 503};
        case 505:
          return {Keys.MSG: "不支持HTTP协议请求 Ծ‸ Ծ", Keys.CODE: 505};
        default:
          return {Keys.MSG: "请求异常 Ծ‸ Ծ", Keys.CODE: 103};
      }
    } else if (error.type == DioExceptionType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      Log.d("请求取消 Ծ‸ Ծ");
      return {Keys.MSG: "请求取消 Ծ‸ Ծ", Keys.CODE: 104};
    } else {
      // Default error type, Some other Error. In this case, you can use the DioError.error if it is not null.
      return {Keys.MSG: "未知错误 Ծ‸ Ծ", Keys.CODE: 105};
    }
  }
}

class HeaderInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, handler) async {
    return handler.next(options);
  }
}
