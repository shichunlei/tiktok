import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  String? id;
  String? info;
  String? label;
  String? name;
  String? profileFile;
  int likeCount;
  int commentsCount;
  int shareCount;
  String? url;
  int userId;

  Video(
      {this.id,
      this.info,
      this.label,
      this.name,
      this.profileFile,
      this.likeCount = 0,
      this.commentsCount = 0,
      this.shareCount = 0,
      this.url,
      this.userId = 0});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
