import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:voa_clone/model/media.dart';

ResponseVideo responseVideoFromJson(String str) =>
    ResponseVideo.fromJson(json.decode(str));

String responseVideoToJson(ResponseVideo data) => json.encode(data.toJson());

class ResponseVideo extends Equatable {
  final List<Video> results;

  const ResponseVideo({required this.results});

  factory ResponseVideo.fromJson(Map<String, dynamic> json) => ResponseVideo(
    results: List<Video>.from(json["results"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "videos": List<dynamic>.from(results.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [results];
}

class Video extends Media {
  final String videoHq;
  final String videoUrl;
  final String ytUrl;
  final String videoMobile;
  final Pubtime pubtime;
  final int videoId;

  const Video({
    required this.videoUrl,
    required this.ytUrl,
    required this.videoMobile,
    required this.videoHq,
    required this.pubtime,
    required this.videoId,
    required super.objectId,
    required super.title,
    required super.subtitle,
    required super.cover,
    required super.duration,
    required super.createdAt,
    required super.updatedAt,
    required super.acl,
    required super.branchLink,
    required super.likeCount,
    required super.viewCount,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    objectId: json["objectId"],
    title: json["title"],
    subtitle: json["subtitle"],
    cover: json["cover"],
    duration: json["duration"],
    videoUrl: json["video_url"],
    ytUrl: json["yt_url"],
    videoMobile: json["video_mobile"],
    videoHq: json["video_hq"],
    pubtime: Pubtime.fromJson(json["pubtime"]),
    branchLink: json["branch_link"],
    videoId: json["video_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    likeCount: json["like_count"],
    viewCount: json["view_count"],
    acl: Acl.fromJson(json["ACL"]),
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "title": title,
    "subtitle": subtitle,
    "cover": cover,
    "duration": duration,
    "video_url": videoUrl,
    "yt_url": ytUrl,
    "video_mobile": videoMobile,
    "video_hq": videoHq,
    "pubtime": pubtime.toJson(),
    "branch_link": branchLink,
    "video_id": videoId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "like_count": likeCount,
    "view_count": viewCount,
    "ACL": acl.toJson(),
  };

  @override
  List<Object?> get props => [
    ...super.props,
    videoHq,
    videoUrl,
    ytUrl,
    videoMobile,
    pubtime,
    videoId,
  ];
}

class Pubtime extends Equatable {
  final PubtimeType type;
  final DateTime iso;

  const Pubtime({required this.type, required this.iso});

  factory Pubtime.fromJson(Map<String, dynamic> json) => Pubtime(
    type: typeValues.map[json["__type"]]!,
    iso: DateTime.parse(json["iso"]),
  );

  Map<String, dynamic> toJson() => {
    "__type": typeValues.reverse[type],
    "iso": iso.toIso8601String(),
  };

  @override
  List<Object?> get props => [type, iso];
}
