import 'package:json_annotation/json_annotation.dart';

part 'sub_user.g.dart';

@JsonSerializable()
class SubUser {
  int id;
  String? username;
  bool onlineState;

  SubUser({
    this.id = 0,
    this.username,
    this.onlineState = false,
  });

  factory SubUser.fromJson(Map<String, dynamic> json) => _$SubUserFromJson(json);

  Map<String, dynamic> toJson() => _$SubUserToJson(this);
}
