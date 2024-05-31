import 'package:json_annotation/json_annotation.dart';

part 'login_result.g.dart';

@JsonSerializable()
class LoginResult {
  int id;
  List<String> roleList;
  String? token;
  String? username;

  LoginResult({this.id = 0, this.roleList = const [], this.token, this.username});

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
