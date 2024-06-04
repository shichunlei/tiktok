import 'dart:async';

import 'package:tiktok/beans/base_bean.dart';
import 'package:tiktok/beans/card_type.dart';
import 'package:tiktok/beans/login_result.dart';
import 'package:tiktok/beans/recharge_address.dart';
import 'package:tiktok/beans/sub_user.dart';
import 'package:tiktok/beans/user_info.dart';
import 'package:tiktok/beans/video.dart';
import 'package:tiktok/beans/withdrawal_address.dart';
import 'package:tiktok/beans/withdrawal_record_info.dart';
import 'package:tiktok/utils/http_utils.dart';
import 'package:tiktok/utils/toast_util.dart';

class Repository {
  /// 登录
  static Future<LoginResult?> login({String? username, String? password}) async {
    var response = await HttpUtils.getInstance().request('/login',
        params: {"username": username, "password": password, "remember": true},
        contentType: "application/x-www-form-urlencoded");
    BaseBean result = BaseBean.fromJsonToObject(response);
    if (result.code == 200) {
      return LoginResult.fromJson(result.data);
    } else {
      showToast(text: "${result.message}");
      return null;
    }
  }

  /// 请求红包收益 TODO
  ///
  static Future<Map?> earnings({int? time, num? amount, String? furtive}) async {
    var response = await HttpUtils.getInstance().request('/earnings', params: {
      if (time != null) "time": time,
      if (amount != null) "amount": amount,
      if (furtive != null) "furtive": furtive
    });
    return response;
  }

  /// 注册下级用户
  ///
  static Future<BaseBean> registerSubUser({String? username, String? password}) async {
    var response = await HttpUtils.getInstance()
        .request('/user/registerSubuser', params: {"username": username, "password": password});
    return BaseBean.fromJson(response);
  }

  /// 用户提现操作 todo
  ///
  ///   "money": "5.4",
  ///   "networkChannelId": "1795755200598515714",
  ///   "networkMultipleChannels": "test",
  ///   "password": "123"
  ///
  static Future<Map?> withdrawalRecord(
      {String? money, String? networkChannelId, String? networkMultipleChannels, String? password}) async {
    var response = await HttpUtils.getInstance().request('/withdrawalRecord', params: {
      "money": money,
      "password": password,
      "networkChannelId": networkChannelId,
      "networkMultipleChannels": networkMultipleChannels
    });
    return response;
  }

  /// 激活会员卡 todo
  ///
  static Future<BaseBean> rechargeRecord(int cardTypeId) async {
    var response = await HttpUtils.getInstance().request('/rechargeRecord', params: {"cardTypeId": cardTypeId});
    return BaseBean.fromJson(response);
  }

  /// 修改密码
  ///
  static Future<BaseBean> updateUserPassword(
      {String? oldPassword, String? newPassword, String? confirmPassword}) async {
    var response = await HttpUtils.getInstance().request('/user/updateUserPassword',
        method: HttpUtils.PUT,
        params: {"oldPassword": oldPassword, "newPassword": newPassword, "confirmPassword": confirmPassword});
    return BaseBean.fromJson(response);
  }

  /// 查询启用的提现通道
  ///
  static Future<List<WithdrawalAddress>> withdrawalAddress() async {
    var response = await HttpUtils.getInstance().request('/withdrawal-address/state', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToList(response);
    if (result.code == 200) {
      return result.items.map((e) => WithdrawalAddress.fromJson(e)).toList();
    } else {
      showToast(text: "${result.message}");
      return [];
    }
  }

  /// 查询收益比例
  ///
  static Future<double> commissionRate() async {
    var response = await HttpUtils.getInstance().request('/withdrawalRecord/commissionRate', method: HttpUtils.GET);
    if (response["code"] == 200) {
      return response["data"] as double;
    } else {
      showToast(text: "${response["message"]}");
      return .0;
    }
  }

  /// 用户查询所有下级用户
  ///
  static Future<List<SubUser>> getSubUserById() async {
    var response = await HttpUtils.getInstance().request('/user/getSubuserById', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToList(response);
    if (result.code == 200) {
      return result.items.map((e) => SubUser.fromJson(e)).toList();
    } else {
      showToast(text: "${result.message}");
      return [];
    }
  }

  /// 获取个人信息
  ///
  static Future<UserInfo?> getUserInfoById() async {
    var response = await HttpUtils.getInstance().request('/user/getUserInfoById', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToObject(response);
    if (result.code == 200) {
      return UserInfo.fromJson(result.data);
    } else {
      showToast(text: "${result.message}");
      return null;
    }
  }

  /// 获取app下载链接
  ///
  static Future<String> downloadAddress() async {
    var response = await HttpUtils.getInstance().request('/video-upload/downloadAddress', method: HttpUtils.GET);
    if (response["code"] == 200) {
      return response["data"] as String;
    } else {
      showToast(text: "${response["message"]}");
      return "";
    }
  }

  /// 用户查询激活卡类型
  ///
  static Future<List<CardType>> cardType() async {
    var response = await HttpUtils.getInstance().request('/card-type', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToList(response);
    if (result.code == 200) {
      return result.items.map((e) => CardType.fromJson(e)).toList();
    } else {
      showToast(text: "${result.message}");
      return [];
    }
  }

  /// 用户查询启用的充值地址 todo
  ///
  static Future<List<RechargeAddress>> rechargeAddress() async {
    var response = await HttpUtils.getInstance().request('/recharge-address/state', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToList(response);
    if (result.code == 200) {
      return result.items.map((e) => RechargeAddress.fromJson(e)).toList();
    } else {
      showToast(text: "${result.message}");
      return [];
    }
  }

  /// 用户查询提现信息(提现最低金额和服务费)
  ///
  static Future<WithdrawalRecordInfo?> withdrawalRecordInfo() async {
    var response = await HttpUtils.getInstance().request('/withdrawalRecord/info', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToObject(response);
    if (result.code == 200) {
      return WithdrawalRecordInfo.fromJson(result.data);
    } else {
      showToast(text: "${result.message}");
      return null;
    }
  }

  /// 首页视频列表
  ///
  static Future<List<Video>> videoUpload() async {
    var response = await HttpUtils.getInstance().request('/video-upload', method: HttpUtils.GET);
    BaseBean result = BaseBean.fromJsonToList(response);
    if (result.code == 200) {
      return result.items.map((e) => Video.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
