import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_address.g.dart';

@JsonSerializable()
class WithdrawalAddress {
  String? id;
  String? name;
  int state;

  WithdrawalAddress({
    this.id,
    this.name,
    this.state = 0,
  });

  factory WithdrawalAddress.fromJson(Map<String, dynamic> json) => _$WithdrawalAddressFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalAddressToJson(this);
}
