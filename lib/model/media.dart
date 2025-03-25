import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final String objectId;
  final String title;
  final String? subtitle;
  final String cover;
  final int duration;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Acl acl;
  final String branchLink;
  final int likeCount;
  final int viewCount;

  const Media({
    required this.objectId,
    required this.title,
    required this.subtitle,
    required this.cover,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.acl,
    required this.branchLink,
    required this.likeCount,
    required this.viewCount,
  });

  @override
  List<Object?> get props => [
    objectId,
    title,
    subtitle,
    cover,
    duration,
    createdAt,
    updatedAt,
    acl,
    branchLink,
    likeCount,
    viewCount,
  ];
}

class Acl extends Equatable {
  final Empty empty;

  const Acl({required this.empty});

  factory Acl.fromJson(Map<String, dynamic> json) =>
      Acl(empty: Empty.fromJson(json["*"]));

  Map<String, dynamic> toJson() => {"*": empty.toJson()};

  @override
  List<Object?> get props => [empty];
}

class Empty extends Equatable {
  final bool read;

  const Empty({required this.read});

  factory Empty.fromJson(Map<String, dynamic> json) =>
      Empty(read: json["read"]);

  Map<String, dynamic> toJson() => {"read": read};

  @override
  List<Object?> get props => [read];
}

enum PubtimeType { date }

final typeValues = EnumValues({"Date": PubtimeType.date});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
