import 'package:json_annotation/json_annotation.dart';

part 'recharge_address.g.dart';

@JsonSerializable()
class RechargeAddress {
  String? id;
  String? address;
  String? name;
  int state;

  RechargeAddress({
    this.id,
    this.address,
    this.name,
    this.state = 0,
  });

  factory RechargeAddress.fromJson(Map<String, dynamic> json) => _$RechargeAddressFromJson(json);

  Map<String, dynamic> toJson() => _$RechargeAddressToJson(this);
}
