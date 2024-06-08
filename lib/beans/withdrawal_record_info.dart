import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_record_info.g.dart';

@JsonSerializable()
class WithdrawalRecordInfo {
  double withdrawalMinAmount;
  int serviceCharge;
  double balance;

  WithdrawalRecordInfo({this.withdrawalMinAmount = .0, this.serviceCharge = 0, this.balance = .0});

  factory WithdrawalRecordInfo.fromJson(Map<String, dynamic> json) => _$WithdrawalRecordInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalRecordInfoToJson(this);
}
