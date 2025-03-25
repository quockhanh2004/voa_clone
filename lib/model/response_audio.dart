import 'dart:convert';

import 'package:voa_clone/model/media.dart';

ResponseAudio responseAudioFromJson(String str) =>
    ResponseAudio.fromJson(json.decode(str));

String responseAudioToJson(ResponseAudio data) => json.encode(data.toJson());

class ResponseAudio {
  List<Audio> results;

  ResponseAudio({required this.results});

  factory ResponseAudio.fromJson(Map<String, dynamic> json) => ResponseAudio(
    results: List<Audio>.from(json["results"].map((x) => Audio.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Audio extends Media {
  final String? audioHq;
  final String cfUrl;
  final String hero;
  final int articleId;
  final String audio;
  final OriginalPubtime originalPubtime;
  final bool? audioCaptionOk;

  const Audio({
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
    this.audioHq,
    required this.cfUrl,
    required this.hero,
    required this.articleId,
    required this.audio,
    required this.originalPubtime,
    this.audioCaptionOk,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      objectId: json["objectId"],
      title: json["title"],
      subtitle: json["subtitle"],
      cover: json["cover"],
      hero: json["hero"],
      audio: json["audio"],
      audioHq: json["audio_hq"],
      audioCaptionOk: json["audio_caption_ok"] ?? true,
      duration: json["duration"],
      cfUrl: json["cf_url"],
      originalPubtime: OriginalPubtime.fromJson(json["original_pubtime"]),
      branchLink: json["branch_link"],
      articleId: json["article_id"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      viewCount: json["view_count"] ?? 0,
      likeCount: json["like_count"] ?? 0,
      acl: Acl.fromJson(json["ACL"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "title": title,
    "subtitle": subtitle,
    "cover": cover,
    "hero": hero,
    "audio": audio,
    "audio_hq": audioHq,
    "audio_caption_ok": audioCaptionOk,
    "duration": duration,
    "cf_url": cfUrl,
    "original_pubtime": originalPubtime.toJson(),
    "branch_link": branchLink,
    "article_id": articleId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "view_count": viewCount,
    "like_count": likeCount,
    "ACL": acl.toJson(),
  };
}

class OriginalPubtime {
  final PubtimeType type;
  final DateTime iso;

  const OriginalPubtime({required this.type, required this.iso});

  factory OriginalPubtime.fromJson(Map<String, dynamic> json) =>
      OriginalPubtime(type: PubtimeType.date, iso: DateTime.parse(json["iso"]));

  Map<String, dynamic> toJson() => {
    "__type": "Date",
    "iso": iso.toIso8601String(),
  };
}
