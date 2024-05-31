import 'package:json_annotation/json_annotation.dart';

part 'card_type.g.dart';

@JsonSerializable()
class CardType {
  int id;
  String? name;
  int duration;
  String? description;
  num price;

  CardType({
    this.id = 0,
    this.name,
    this.duration = 0,
    this.description,
    this.price = 0,
  });

  factory CardType.fromJson(Map<String, dynamic> json) => _$CardTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CardTypeToJson(this);
}
