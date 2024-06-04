import 'package:json_annotation/json_annotation.dart';

part 'earnings.g.dart';

@JsonSerializable()
class Earnings {
  String? furtiveToken;
  int duration;
  double bigDecimal;

  Earnings({this.furtiveToken, this.duration = 30, this.bigDecimal = .0});

  factory Earnings.fromJson(Map<String, dynamic> json) => _$EarningsFromJson(json);

  Map<String, dynamic> toJson() => _$EarningsToJson(this);
}
