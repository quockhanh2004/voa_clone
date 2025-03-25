// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AudiosTableTable extends AudiosTable
    with TableInfo<$AudiosTableTable, AudiosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudiosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtitleMeta =
      const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
      'subtitle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverMeta = const VerificationMeta('cover');
  @override
  late final GeneratedColumn<String> cover = GeneratedColumn<String>(
      'cover', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _audioHqMeta =
      const VerificationMeta('audioHq');
  @override
  late final GeneratedColumn<String> audioHq = GeneratedColumn<String>(
      'audio_hq', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cfUrlMeta = const VerificationMeta('cfUrl');
  @override
  late final GeneratedColumn<String> cfUrl = GeneratedColumn<String>(
      'cf_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _heroMeta = const VerificationMeta('hero');
  @override
  late final GeneratedColumn<String> hero = GeneratedColumn<String>(
      'hero', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<int> articleId = GeneratedColumn<int>(
      'article_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _audioMeta = const VerificationMeta('audio');
  @override
  late final GeneratedColumn<String> audio = GeneratedColumn<String>(
      'audio', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalPubtimeMeta =
      const VerificationMeta('originalPubtime');
  @override
  late final GeneratedColumn<DateTime> originalPubtime =
      GeneratedColumn<DateTime>('original_pubtime', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _audioCaptionOkMeta =
      const VerificationMeta('audioCaptionOk');
  @override
  late final GeneratedColumn<bool> audioCaptionOk = GeneratedColumn<bool>(
      'audio_caption_ok', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("audio_caption_ok" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _branchLinkMeta =
      const VerificationMeta('branchLink');
  @override
  late final GeneratedColumn<String> branchLink = GeneratedColumn<String>(
      'branch_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _likeCountMeta =
      const VerificationMeta('likeCount');
  @override
  late final GeneratedColumn<int> likeCount = GeneratedColumn<int>(
      'like_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _viewCountMeta =
      const VerificationMeta('viewCount');
  @override
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _aclJsonMeta =
      const VerificationMeta('aclJson');
  @override
  late final GeneratedColumn<String> aclJson = GeneratedColumn<String>(
      'acl_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        objectId,
        title,
        subtitle,
        cover,
        duration,
        audioHq,
        cfUrl,
        hero,
        articleId,
        audio,
        originalPubtime,
        audioCaptionOk,
        createdAt,
        updatedAt,
        branchLink,
        likeCount,
        viewCount,
        aclJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audios_table';
  @override
  VerificationContext validateIntegrity(Insertable<AudiosTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover']!, _coverMeta));
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('audio_hq')) {
      context.handle(_audioHqMeta,
          audioHq.isAcceptableOrUnknown(data['audio_hq']!, _audioHqMeta));
    }
    if (data.containsKey('cf_url')) {
      context.handle(
          _cfUrlMeta, cfUrl.isAcceptableOrUnknown(data['cf_url']!, _cfUrlMeta));
    } else if (isInserting) {
      context.missing(_cfUrlMeta);
    }
    if (data.containsKey('hero')) {
      context.handle(
          _heroMeta, hero.isAcceptableOrUnknown(data['hero']!, _heroMeta));
    } else if (isInserting) {
      context.missing(_heroMeta);
    }
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('audio')) {
      context.handle(
          _audioMeta, audio.isAcceptableOrUnknown(data['audio']!, _audioMeta));
    } else if (isInserting) {
      context.missing(_audioMeta);
    }
    if (data.containsKey('original_pubtime')) {
      context.handle(
          _originalPubtimeMeta,
          originalPubtime.isAcceptableOrUnknown(
              data['original_pubtime']!, _originalPubtimeMeta));
    } else if (isInserting) {
      context.missing(_originalPubtimeMeta);
    }
    if (data.containsKey('audio_caption_ok')) {
      context.handle(
          _audioCaptionOkMeta,
          audioCaptionOk.isAcceptableOrUnknown(
              data['audio_caption_ok']!, _audioCaptionOkMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('branch_link')) {
      context.handle(
          _branchLinkMeta,
          branchLink.isAcceptableOrUnknown(
              data['branch_link']!, _branchLinkMeta));
    } else if (isInserting) {
      context.missing(_branchLinkMeta);
    }
    if (data.containsKey('like_count')) {
      context.handle(_likeCountMeta,
          likeCount.isAcceptableOrUnknown(data['like_count']!, _likeCountMeta));
    } else if (isInserting) {
      context.missing(_likeCountMeta);
    }
    if (data.containsKey('view_count')) {
      context.handle(_viewCountMeta,
          viewCount.isAcceptableOrUnknown(data['view_count']!, _viewCountMeta));
    } else if (isInserting) {
      context.missing(_viewCountMeta);
    }
    if (data.containsKey('acl_json')) {
      context.handle(_aclJsonMeta,
          aclJson.isAcceptableOrUnknown(data['acl_json']!, _aclJsonMeta));
    } else if (isInserting) {
      context.missing(_aclJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectId};
  @override
  AudiosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudiosTableData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtitle']),
      cover: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      audioHq: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_hq']),
      cfUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cf_url'])!,
      hero: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hero'])!,
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}article_id'])!,
      audio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio'])!,
      originalPubtime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}original_pubtime'])!,
      audioCaptionOk: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}audio_caption_ok']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      branchLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_link'])!,
      likeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}like_count'])!,
      viewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}view_count'])!,
      aclJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}acl_json'])!,
    );
  }

  @override
  $AudiosTableTable createAlias(String alias) {
    return $AudiosTableTable(attachedDatabase, alias);
  }
}

class AudiosTableData extends DataClass implements Insertable<AudiosTableData> {
  final String objectId;
  final String title;
  final String? subtitle;
  final String cover;
  final int duration;
  final String? audioHq;
  final String cfUrl;
  final String hero;
  final int articleId;
  final String audio;
  final DateTime originalPubtime;
  final bool? audioCaptionOk;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String branchLink;
  final int likeCount;
  final int viewCount;
  final String aclJson;
  const AudiosTableData(
      {required this.objectId,
      required this.title,
      this.subtitle,
      required this.cover,
      required this.duration,
      this.audioHq,
      required this.cfUrl,
      required this.hero,
      required this.articleId,
      required this.audio,
      required this.originalPubtime,
      this.audioCaptionOk,
      required this.createdAt,
      required this.updatedAt,
      required this.branchLink,
      required this.likeCount,
      required this.viewCount,
      required this.aclJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    map['cover'] = Variable<String>(cover);
    map['duration'] = Variable<int>(duration);
    if (!nullToAbsent || audioHq != null) {
      map['audio_hq'] = Variable<String>(audioHq);
    }
    map['cf_url'] = Variable<String>(cfUrl);
    map['hero'] = Variable<String>(hero);
    map['article_id'] = Variable<int>(articleId);
    map['audio'] = Variable<String>(audio);
    map['original_pubtime'] = Variable<DateTime>(originalPubtime);
    if (!nullToAbsent || audioCaptionOk != null) {
      map['audio_caption_ok'] = Variable<bool>(audioCaptionOk);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['branch_link'] = Variable<String>(branchLink);
    map['like_count'] = Variable<int>(likeCount);
    map['view_count'] = Variable<int>(viewCount);
    map['acl_json'] = Variable<String>(aclJson);
    return map;
  }

  AudiosTableCompanion toCompanion(bool nullToAbsent) {
    return AudiosTableCompanion(
      objectId: Value(objectId),
      title: Value(title),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      cover: Value(cover),
      duration: Value(duration),
      audioHq: audioHq == null && nullToAbsent
          ? const Value.absent()
          : Value(audioHq),
      cfUrl: Value(cfUrl),
      hero: Value(hero),
      articleId: Value(articleId),
      audio: Value(audio),
      originalPubtime: Value(originalPubtime),
      audioCaptionOk: audioCaptionOk == null && nullToAbsent
          ? const Value.absent()
          : Value(audioCaptionOk),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      branchLink: Value(branchLink),
      likeCount: Value(likeCount),
      viewCount: Value(viewCount),
      aclJson: Value(aclJson),
    );
  }

  factory AudiosTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudiosTableData(
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      cover: serializer.fromJson<String>(json['cover']),
      duration: serializer.fromJson<int>(json['duration']),
      audioHq: serializer.fromJson<String?>(json['audioHq']),
      cfUrl: serializer.fromJson<String>(json['cfUrl']),
      hero: serializer.fromJson<String>(json['hero']),
      articleId: serializer.fromJson<int>(json['articleId']),
      audio: serializer.fromJson<String>(json['audio']),
      originalPubtime: serializer.fromJson<DateTime>(json['originalPubtime']),
      audioCaptionOk: serializer.fromJson<bool?>(json['audioCaptionOk']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      branchLink: serializer.fromJson<String>(json['branchLink']),
      likeCount: serializer.fromJson<int>(json['likeCount']),
      viewCount: serializer.fromJson<int>(json['viewCount']),
      aclJson: serializer.fromJson<String>(json['aclJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String?>(subtitle),
      'cover': serializer.toJson<String>(cover),
      'duration': serializer.toJson<int>(duration),
      'audioHq': serializer.toJson<String?>(audioHq),
      'cfUrl': serializer.toJson<String>(cfUrl),
      'hero': serializer.toJson<String>(hero),
      'articleId': serializer.toJson<int>(articleId),
      'audio': serializer.toJson<String>(audio),
      'originalPubtime': serializer.toJson<DateTime>(originalPubtime),
      'audioCaptionOk': serializer.toJson<bool?>(audioCaptionOk),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'branchLink': serializer.toJson<String>(branchLink),
      'likeCount': serializer.toJson<int>(likeCount),
      'viewCount': serializer.toJson<int>(viewCount),
      'aclJson': serializer.toJson<String>(aclJson),
    };
  }

  AudiosTableData copyWith(
          {String? objectId,
          String? title,
          Value<String?> subtitle = const Value.absent(),
          String? cover,
          int? duration,
          Value<String?> audioHq = const Value.absent(),
          String? cfUrl,
          String? hero,
          int? articleId,
          String? audio,
          DateTime? originalPubtime,
          Value<bool?> audioCaptionOk = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          String? branchLink,
          int? likeCount,
          int? viewCount,
          String? aclJson}) =>
      AudiosTableData(
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        subtitle: subtitle.present ? subtitle.value : this.subtitle,
        cover: cover ?? this.cover,
        duration: duration ?? this.duration,
        audioHq: audioHq.present ? audioHq.value : this.audioHq,
        cfUrl: cfUrl ?? this.cfUrl,
        hero: hero ?? this.hero,
        articleId: articleId ?? this.articleId,
        audio: audio ?? this.audio,
        originalPubtime: originalPubtime ?? this.originalPubtime,
        audioCaptionOk:
            audioCaptionOk.present ? audioCaptionOk.value : this.audioCaptionOk,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        branchLink: branchLink ?? this.branchLink,
        likeCount: likeCount ?? this.likeCount,
        viewCount: viewCount ?? this.viewCount,
        aclJson: aclJson ?? this.aclJson,
      );
  AudiosTableData copyWithCompanion(AudiosTableCompanion data) {
    return AudiosTableData(
      objectId: data.objectId.present ? data.objectId.value : this.objectId,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      cover: data.cover.present ? data.cover.value : this.cover,
      duration: data.duration.present ? data.duration.value : this.duration,
      audioHq: data.audioHq.present ? data.audioHq.value : this.audioHq,
      cfUrl: data.cfUrl.present ? data.cfUrl.value : this.cfUrl,
      hero: data.hero.present ? data.hero.value : this.hero,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      audio: data.audio.present ? data.audio.value : this.audio,
      originalPubtime: data.originalPubtime.present
          ? data.originalPubtime.value
          : this.originalPubtime,
      audioCaptionOk: data.audioCaptionOk.present
          ? data.audioCaptionOk.value
          : this.audioCaptionOk,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      branchLink:
          data.branchLink.present ? data.branchLink.value : this.branchLink,
      likeCount: data.likeCount.present ? data.likeCount.value : this.likeCount,
      viewCount: data.viewCount.present ? data.viewCount.value : this.viewCount,
      aclJson: data.aclJson.present ? data.aclJson.value : this.aclJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudiosTableData(')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('cover: $cover, ')
          ..write('duration: $duration, ')
          ..write('audioHq: $audioHq, ')
          ..write('cfUrl: $cfUrl, ')
          ..write('hero: $hero, ')
          ..write('articleId: $articleId, ')
          ..write('audio: $audio, ')
          ..write('originalPubtime: $originalPubtime, ')
          ..write('audioCaptionOk: $audioCaptionOk, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('branchLink: $branchLink, ')
          ..write('likeCount: $likeCount, ')
          ..write('viewCount: $viewCount, ')
          ..write('aclJson: $aclJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      objectId,
      title,
      subtitle,
      cover,
      duration,
      audioHq,
      cfUrl,
      hero,
      articleId,
      audio,
      originalPubtime,
      audioCaptionOk,
      createdAt,
      updatedAt,
      branchLink,
      likeCount,
      viewCount,
      aclJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudiosTableData &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.cover == this.cover &&
          other.duration == this.duration &&
          other.audioHq == this.audioHq &&
          other.cfUrl == this.cfUrl &&
          other.hero == this.hero &&
          other.articleId == this.articleId &&
          other.audio == this.audio &&
          other.originalPubtime == this.originalPubtime &&
          other.audioCaptionOk == this.audioCaptionOk &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.branchLink == this.branchLink &&
          other.likeCount == this.likeCount &&
          other.viewCount == this.viewCount &&
          other.aclJson == this.aclJson);
}

class AudiosTableCompanion extends UpdateCompanion<AudiosTableData> {
  final Value<String> objectId;
  final Value<String> title;
  final Value<String?> subtitle;
  final Value<String> cover;
  final Value<int> duration;
  final Value<String?> audioHq;
  final Value<String> cfUrl;
  final Value<String> hero;
  final Value<int> articleId;
  final Value<String> audio;
  final Value<DateTime> originalPubtime;
  final Value<bool?> audioCaptionOk;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> branchLink;
  final Value<int> likeCount;
  final Value<int> viewCount;
  final Value<String> aclJson;
  final Value<int> rowid;
  const AudiosTableCompanion({
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.cover = const Value.absent(),
    this.duration = const Value.absent(),
    this.audioHq = const Value.absent(),
    this.cfUrl = const Value.absent(),
    this.hero = const Value.absent(),
    this.articleId = const Value.absent(),
    this.audio = const Value.absent(),
    this.originalPubtime = const Value.absent(),
    this.audioCaptionOk = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.branchLink = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.aclJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AudiosTableCompanion.insert({
    required String objectId,
    required String title,
    this.subtitle = const Value.absent(),
    required String cover,
    required int duration,
    this.audioHq = const Value.absent(),
    required String cfUrl,
    required String hero,
    required int articleId,
    required String audio,
    required DateTime originalPubtime,
    this.audioCaptionOk = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required String branchLink,
    required int likeCount,
    required int viewCount,
    required String aclJson,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        title = Value(title),
        cover = Value(cover),
        duration = Value(duration),
        cfUrl = Value(cfUrl),
        hero = Value(hero),
        articleId = Value(articleId),
        audio = Value(audio),
        originalPubtime = Value(originalPubtime),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        branchLink = Value(branchLink),
        likeCount = Value(likeCount),
        viewCount = Value(viewCount),
        aclJson = Value(aclJson);
  static Insertable<AudiosTableData> custom({
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? cover,
    Expression<int>? duration,
    Expression<String>? audioHq,
    Expression<String>? cfUrl,
    Expression<String>? hero,
    Expression<int>? articleId,
    Expression<String>? audio,
    Expression<DateTime>? originalPubtime,
    Expression<bool>? audioCaptionOk,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? branchLink,
    Expression<int>? likeCount,
    Expression<int>? viewCount,
    Expression<String>? aclJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (cover != null) 'cover': cover,
      if (duration != null) 'duration': duration,
      if (audioHq != null) 'audio_hq': audioHq,
      if (cfUrl != null) 'cf_url': cfUrl,
      if (hero != null) 'hero': hero,
      if (articleId != null) 'article_id': articleId,
      if (audio != null) 'audio': audio,
      if (originalPubtime != null) 'original_pubtime': originalPubtime,
      if (audioCaptionOk != null) 'audio_caption_ok': audioCaptionOk,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (branchLink != null) 'branch_link': branchLink,
      if (likeCount != null) 'like_count': likeCount,
      if (viewCount != null) 'view_count': viewCount,
      if (aclJson != null) 'acl_json': aclJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AudiosTableCompanion copyWith(
      {Value<String>? objectId,
      Value<String>? title,
      Value<String?>? subtitle,
      Value<String>? cover,
      Value<int>? duration,
      Value<String?>? audioHq,
      Value<String>? cfUrl,
      Value<String>? hero,
      Value<int>? articleId,
      Value<String>? audio,
      Value<DateTime>? originalPubtime,
      Value<bool?>? audioCaptionOk,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? branchLink,
      Value<int>? likeCount,
      Value<int>? viewCount,
      Value<String>? aclJson,
      Value<int>? rowid}) {
    return AudiosTableCompanion(
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      cover: cover ?? this.cover,
      duration: duration ?? this.duration,
      audioHq: audioHq ?? this.audioHq,
      cfUrl: cfUrl ?? this.cfUrl,
      hero: hero ?? this.hero,
      articleId: articleId ?? this.articleId,
      audio: audio ?? this.audio,
      originalPubtime: originalPubtime ?? this.originalPubtime,
      audioCaptionOk: audioCaptionOk ?? this.audioCaptionOk,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      branchLink: branchLink ?? this.branchLink,
      likeCount: likeCount ?? this.likeCount,
      viewCount: viewCount ?? this.viewCount,
      aclJson: aclJson ?? this.aclJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (audioHq.present) {
      map['audio_hq'] = Variable<String>(audioHq.value);
    }
    if (cfUrl.present) {
      map['cf_url'] = Variable<String>(cfUrl.value);
    }
    if (hero.present) {
      map['hero'] = Variable<String>(hero.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<int>(articleId.value);
    }
    if (audio.present) {
      map['audio'] = Variable<String>(audio.value);
    }
    if (originalPubtime.present) {
      map['original_pubtime'] = Variable<DateTime>(originalPubtime.value);
    }
    if (audioCaptionOk.present) {
      map['audio_caption_ok'] = Variable<bool>(audioCaptionOk.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (branchLink.present) {
      map['branch_link'] = Variable<String>(branchLink.value);
    }
    if (likeCount.present) {
      map['like_count'] = Variable<int>(likeCount.value);
    }
    if (viewCount.present) {
      map['view_count'] = Variable<int>(viewCount.value);
    }
    if (aclJson.present) {
      map['acl_json'] = Variable<String>(aclJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudiosTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('cover: $cover, ')
          ..write('duration: $duration, ')
          ..write('audioHq: $audioHq, ')
          ..write('cfUrl: $cfUrl, ')
          ..write('hero: $hero, ')
          ..write('articleId: $articleId, ')
          ..write('audio: $audio, ')
          ..write('originalPubtime: $originalPubtime, ')
          ..write('audioCaptionOk: $audioCaptionOk, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('branchLink: $branchLink, ')
          ..write('likeCount: $likeCount, ')
          ..write('viewCount: $viewCount, ')
          ..write('aclJson: $aclJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VideosTableTable extends VideosTable
    with TableInfo<$VideosTableTable, VideosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtitleMeta =
      const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
      'subtitle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverMeta = const VerificationMeta('cover');
  @override
  late final GeneratedColumn<String> cover = GeneratedColumn<String>(
      'cover', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _videoHqMeta =
      const VerificationMeta('videoHq');
  @override
  late final GeneratedColumn<String> videoHq = GeneratedColumn<String>(
      'video_hq', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ytUrlMeta = const VerificationMeta('ytUrl');
  @override
  late final GeneratedColumn<String> ytUrl = GeneratedColumn<String>(
      'yt_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _videoMobileMeta =
      const VerificationMeta('videoMobile');
  @override
  late final GeneratedColumn<String> videoMobile = GeneratedColumn<String>(
      'video_mobile', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubtimeMeta =
      const VerificationMeta('pubtime');
  @override
  late final GeneratedColumn<DateTime> pubtime = GeneratedColumn<DateTime>(
      'pubtime', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _videoIdMeta =
      const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<int> videoId = GeneratedColumn<int>(
      'video_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _branchLinkMeta =
      const VerificationMeta('branchLink');
  @override
  late final GeneratedColumn<String> branchLink = GeneratedColumn<String>(
      'branch_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _likeCountMeta =
      const VerificationMeta('likeCount');
  @override
  late final GeneratedColumn<int> likeCount = GeneratedColumn<int>(
      'like_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _viewCountMeta =
      const VerificationMeta('viewCount');
  @override
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _aclJsonMeta =
      const VerificationMeta('aclJson');
  @override
  late final GeneratedColumn<String> aclJson = GeneratedColumn<String>(
      'acl_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        objectId,
        title,
        subtitle,
        cover,
        duration,
        videoHq,
        videoUrl,
        ytUrl,
        videoMobile,
        pubtime,
        videoId,
        createdAt,
        updatedAt,
        branchLink,
        likeCount,
        viewCount,
        aclJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'videos_table';
  @override
  VerificationContext validateIntegrity(Insertable<VideosTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover']!, _coverMeta));
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('video_hq')) {
      context.handle(_videoHqMeta,
          videoHq.isAcceptableOrUnknown(data['video_hq']!, _videoHqMeta));
    } else if (isInserting) {
      context.missing(_videoHqMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    if (data.containsKey('yt_url')) {
      context.handle(
          _ytUrlMeta, ytUrl.isAcceptableOrUnknown(data['yt_url']!, _ytUrlMeta));
    } else if (isInserting) {
      context.missing(_ytUrlMeta);
    }
    if (data.containsKey('video_mobile')) {
      context.handle(
          _videoMobileMeta,
          videoMobile.isAcceptableOrUnknown(
              data['video_mobile']!, _videoMobileMeta));
    } else if (isInserting) {
      context.missing(_videoMobileMeta);
    }
    if (data.containsKey('pubtime')) {
      context.handle(_pubtimeMeta,
          pubtime.isAcceptableOrUnknown(data['pubtime']!, _pubtimeMeta));
    } else if (isInserting) {
      context.missing(_pubtimeMeta);
    }
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('branch_link')) {
      context.handle(
          _branchLinkMeta,
          branchLink.isAcceptableOrUnknown(
              data['branch_link']!, _branchLinkMeta));
    } else if (isInserting) {
      context.missing(_branchLinkMeta);
    }
    if (data.containsKey('like_count')) {
      context.handle(_likeCountMeta,
          likeCount.isAcceptableOrUnknown(data['like_count']!, _likeCountMeta));
    } else if (isInserting) {
      context.missing(_likeCountMeta);
    }
    if (data.containsKey('view_count')) {
      context.handle(_viewCountMeta,
          viewCount.isAcceptableOrUnknown(data['view_count']!, _viewCountMeta));
    } else if (isInserting) {
      context.missing(_viewCountMeta);
    }
    if (data.containsKey('acl_json')) {
      context.handle(_aclJsonMeta,
          aclJson.isAcceptableOrUnknown(data['acl_json']!, _aclJsonMeta));
    } else if (isInserting) {
      context.missing(_aclJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectId};
  @override
  VideosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VideosTableData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtitle']),
      cover: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      videoHq: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_hq'])!,
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url'])!,
      ytUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}yt_url'])!,
      videoMobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_mobile'])!,
      pubtime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}pubtime'])!,
      videoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}video_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      branchLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_link'])!,
      likeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}like_count'])!,
      viewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}view_count'])!,
      aclJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}acl_json'])!,
    );
  }

  @override
  $VideosTableTable createAlias(String alias) {
    return $VideosTableTable(attachedDatabase, alias);
  }
}

class VideosTableData extends DataClass implements Insertable<VideosTableData> {
  final String objectId;
  final String title;
  final String? subtitle;
  final String cover;
  final int duration;
  final String videoHq;
  final String videoUrl;
  final String ytUrl;
  final String videoMobile;
  final DateTime pubtime;
  final int videoId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String branchLink;
  final int likeCount;
  final int viewCount;
  final String aclJson;
  const VideosTableData(
      {required this.objectId,
      required this.title,
      this.subtitle,
      required this.cover,
      required this.duration,
      required this.videoHq,
      required this.videoUrl,
      required this.ytUrl,
      required this.videoMobile,
      required this.pubtime,
      required this.videoId,
      required this.createdAt,
      required this.updatedAt,
      required this.branchLink,
      required this.likeCount,
      required this.viewCount,
      required this.aclJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    map['cover'] = Variable<String>(cover);
    map['duration'] = Variable<int>(duration);
    map['video_hq'] = Variable<String>(videoHq);
    map['video_url'] = Variable<String>(videoUrl);
    map['yt_url'] = Variable<String>(ytUrl);
    map['video_mobile'] = Variable<String>(videoMobile);
    map['pubtime'] = Variable<DateTime>(pubtime);
    map['video_id'] = Variable<int>(videoId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['branch_link'] = Variable<String>(branchLink);
    map['like_count'] = Variable<int>(likeCount);
    map['view_count'] = Variable<int>(viewCount);
    map['acl_json'] = Variable<String>(aclJson);
    return map;
  }

  VideosTableCompanion toCompanion(bool nullToAbsent) {
    return VideosTableCompanion(
      objectId: Value(objectId),
      title: Value(title),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      cover: Value(cover),
      duration: Value(duration),
      videoHq: Value(videoHq),
      videoUrl: Value(videoUrl),
      ytUrl: Value(ytUrl),
      videoMobile: Value(videoMobile),
      pubtime: Value(pubtime),
      videoId: Value(videoId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      branchLink: Value(branchLink),
      likeCount: Value(likeCount),
      viewCount: Value(viewCount),
      aclJson: Value(aclJson),
    );
  }

  factory VideosTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VideosTableData(
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      cover: serializer.fromJson<String>(json['cover']),
      duration: serializer.fromJson<int>(json['duration']),
      videoHq: serializer.fromJson<String>(json['videoHq']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      ytUrl: serializer.fromJson<String>(json['ytUrl']),
      videoMobile: serializer.fromJson<String>(json['videoMobile']),
      pubtime: serializer.fromJson<DateTime>(json['pubtime']),
      videoId: serializer.fromJson<int>(json['videoId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      branchLink: serializer.fromJson<String>(json['branchLink']),
      likeCount: serializer.fromJson<int>(json['likeCount']),
      viewCount: serializer.fromJson<int>(json['viewCount']),
      aclJson: serializer.fromJson<String>(json['aclJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String?>(subtitle),
      'cover': serializer.toJson<String>(cover),
      'duration': serializer.toJson<int>(duration),
      'videoHq': serializer.toJson<String>(videoHq),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'ytUrl': serializer.toJson<String>(ytUrl),
      'videoMobile': serializer.toJson<String>(videoMobile),
      'pubtime': serializer.toJson<DateTime>(pubtime),
      'videoId': serializer.toJson<int>(videoId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'branchLink': serializer.toJson<String>(branchLink),
      'likeCount': serializer.toJson<int>(likeCount),
      'viewCount': serializer.toJson<int>(viewCount),
      'aclJson': serializer.toJson<String>(aclJson),
    };
  }

  VideosTableData copyWith(
          {String? objectId,
          String? title,
          Value<String?> subtitle = const Value.absent(),
          String? cover,
          int? duration,
          String? videoHq,
          String? videoUrl,
          String? ytUrl,
          String? videoMobile,
          DateTime? pubtime,
          int? videoId,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? branchLink,
          int? likeCount,
          int? viewCount,
          String? aclJson}) =>
      VideosTableData(
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        subtitle: subtitle.present ? subtitle.value : this.subtitle,
        cover: cover ?? this.cover,
        duration: duration ?? this.duration,
        videoHq: videoHq ?? this.videoHq,
        videoUrl: videoUrl ?? this.videoUrl,
        ytUrl: ytUrl ?? this.ytUrl,
        videoMobile: videoMobile ?? this.videoMobile,
        pubtime: pubtime ?? this.pubtime,
        videoId: videoId ?? this.videoId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        branchLink: branchLink ?? this.branchLink,
        likeCount: likeCount ?? this.likeCount,
        viewCount: viewCount ?? this.viewCount,
        aclJson: aclJson ?? this.aclJson,
      );
  VideosTableData copyWithCompanion(VideosTableCompanion data) {
    return VideosTableData(
      objectId: data.objectId.present ? data.objectId.value : this.objectId,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      cover: data.cover.present ? data.cover.value : this.cover,
      duration: data.duration.present ? data.duration.value : this.duration,
      videoHq: data.videoHq.present ? data.videoHq.value : this.videoHq,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      ytUrl: data.ytUrl.present ? data.ytUrl.value : this.ytUrl,
      videoMobile:
          data.videoMobile.present ? data.videoMobile.value : this.videoMobile,
      pubtime: data.pubtime.present ? data.pubtime.value : this.pubtime,
      videoId: data.videoId.present ? data.videoId.value : this.videoId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      branchLink:
          data.branchLink.present ? data.branchLink.value : this.branchLink,
      likeCount: data.likeCount.present ? data.likeCount.value : this.likeCount,
      viewCount: data.viewCount.present ? data.viewCount.value : this.viewCount,
      aclJson: data.aclJson.present ? data.aclJson.value : this.aclJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VideosTableData(')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('cover: $cover, ')
          ..write('duration: $duration, ')
          ..write('videoHq: $videoHq, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('ytUrl: $ytUrl, ')
          ..write('videoMobile: $videoMobile, ')
          ..write('pubtime: $pubtime, ')
          ..write('videoId: $videoId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('branchLink: $branchLink, ')
          ..write('likeCount: $likeCount, ')
          ..write('viewCount: $viewCount, ')
          ..write('aclJson: $aclJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      objectId,
      title,
      subtitle,
      cover,
      duration,
      videoHq,
      videoUrl,
      ytUrl,
      videoMobile,
      pubtime,
      videoId,
      createdAt,
      updatedAt,
      branchLink,
      likeCount,
      viewCount,
      aclJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideosTableData &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.cover == this.cover &&
          other.duration == this.duration &&
          other.videoHq == this.videoHq &&
          other.videoUrl == this.videoUrl &&
          other.ytUrl == this.ytUrl &&
          other.videoMobile == this.videoMobile &&
          other.pubtime == this.pubtime &&
          other.videoId == this.videoId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.branchLink == this.branchLink &&
          other.likeCount == this.likeCount &&
          other.viewCount == this.viewCount &&
          other.aclJson == this.aclJson);
}

class VideosTableCompanion extends UpdateCompanion<VideosTableData> {
  final Value<String> objectId;
  final Value<String> title;
  final Value<String?> subtitle;
  final Value<String> cover;
  final Value<int> duration;
  final Value<String> videoHq;
  final Value<String> videoUrl;
  final Value<String> ytUrl;
  final Value<String> videoMobile;
  final Value<DateTime> pubtime;
  final Value<int> videoId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> branchLink;
  final Value<int> likeCount;
  final Value<int> viewCount;
  final Value<String> aclJson;
  final Value<int> rowid;
  const VideosTableCompanion({
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.cover = const Value.absent(),
    this.duration = const Value.absent(),
    this.videoHq = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.ytUrl = const Value.absent(),
    this.videoMobile = const Value.absent(),
    this.pubtime = const Value.absent(),
    this.videoId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.branchLink = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.aclJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VideosTableCompanion.insert({
    required String objectId,
    required String title,
    this.subtitle = const Value.absent(),
    required String cover,
    required int duration,
    required String videoHq,
    required String videoUrl,
    required String ytUrl,
    required String videoMobile,
    required DateTime pubtime,
    required int videoId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String branchLink,
    required int likeCount,
    required int viewCount,
    required String aclJson,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        title = Value(title),
        cover = Value(cover),
        duration = Value(duration),
        videoHq = Value(videoHq),
        videoUrl = Value(videoUrl),
        ytUrl = Value(ytUrl),
        videoMobile = Value(videoMobile),
        pubtime = Value(pubtime),
        videoId = Value(videoId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        branchLink = Value(branchLink),
        likeCount = Value(likeCount),
        viewCount = Value(viewCount),
        aclJson = Value(aclJson);
  static Insertable<VideosTableData> custom({
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? cover,
    Expression<int>? duration,
    Expression<String>? videoHq,
    Expression<String>? videoUrl,
    Expression<String>? ytUrl,
    Expression<String>? videoMobile,
    Expression<DateTime>? pubtime,
    Expression<int>? videoId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? branchLink,
    Expression<int>? likeCount,
    Expression<int>? viewCount,
    Expression<String>? aclJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (cover != null) 'cover': cover,
      if (duration != null) 'duration': duration,
      if (videoHq != null) 'video_hq': videoHq,
      if (videoUrl != null) 'video_url': videoUrl,
      if (ytUrl != null) 'yt_url': ytUrl,
      if (videoMobile != null) 'video_mobile': videoMobile,
      if (pubtime != null) 'pubtime': pubtime,
      if (videoId != null) 'video_id': videoId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (branchLink != null) 'branch_link': branchLink,
      if (likeCount != null) 'like_count': likeCount,
      if (viewCount != null) 'view_count': viewCount,
      if (aclJson != null) 'acl_json': aclJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VideosTableCompanion copyWith(
      {Value<String>? objectId,
      Value<String>? title,
      Value<String?>? subtitle,
      Value<String>? cover,
      Value<int>? duration,
      Value<String>? videoHq,
      Value<String>? videoUrl,
      Value<String>? ytUrl,
      Value<String>? videoMobile,
      Value<DateTime>? pubtime,
      Value<int>? videoId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? branchLink,
      Value<int>? likeCount,
      Value<int>? viewCount,
      Value<String>? aclJson,
      Value<int>? rowid}) {
    return VideosTableCompanion(
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      cover: cover ?? this.cover,
      duration: duration ?? this.duration,
      videoHq: videoHq ?? this.videoHq,
      videoUrl: videoUrl ?? this.videoUrl,
      ytUrl: ytUrl ?? this.ytUrl,
      videoMobile: videoMobile ?? this.videoMobile,
      pubtime: pubtime ?? this.pubtime,
      videoId: videoId ?? this.videoId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      branchLink: branchLink ?? this.branchLink,
      likeCount: likeCount ?? this.likeCount,
      viewCount: viewCount ?? this.viewCount,
      aclJson: aclJson ?? this.aclJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (videoHq.present) {
      map['video_hq'] = Variable<String>(videoHq.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (ytUrl.present) {
      map['yt_url'] = Variable<String>(ytUrl.value);
    }
    if (videoMobile.present) {
      map['video_mobile'] = Variable<String>(videoMobile.value);
    }
    if (pubtime.present) {
      map['pubtime'] = Variable<DateTime>(pubtime.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<int>(videoId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (branchLink.present) {
      map['branch_link'] = Variable<String>(branchLink.value);
    }
    if (likeCount.present) {
      map['like_count'] = Variable<int>(likeCount.value);
    }
    if (viewCount.present) {
      map['view_count'] = Variable<int>(viewCount.value);
    }
    if (aclJson.present) {
      map['acl_json'] = Variable<String>(aclJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideosTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('cover: $cover, ')
          ..write('duration: $duration, ')
          ..write('videoHq: $videoHq, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('ytUrl: $ytUrl, ')
          ..write('videoMobile: $videoMobile, ')
          ..write('pubtime: $pubtime, ')
          ..write('videoId: $videoId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('branchLink: $branchLink, ')
          ..write('likeCount: $likeCount, ')
          ..write('viewCount: $viewCount, ')
          ..write('aclJson: $aclJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTableTable extends FavoritesTable
    with TableInfo<$FavoritesTableTable, FavoritesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
      'media_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [objectId, mediaType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites_table';
  @override
  VerificationContext validateIntegrity(Insertable<FavoritesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    } else if (isInserting) {
      context.missing(_mediaTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectId};
  @override
  FavoritesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritesTableData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FavoritesTableTable createAlias(String alias) {
    return $FavoritesTableTable(attachedDatabase, alias);
  }
}

class FavoritesTableData extends DataClass
    implements Insertable<FavoritesTableData> {
  final String objectId;
  final String mediaType;
  final DateTime createdAt;
  const FavoritesTableData(
      {required this.objectId,
      required this.mediaType,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['media_type'] = Variable<String>(mediaType);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritesTableCompanion(
      objectId: Value(objectId),
      mediaType: Value(mediaType),
      createdAt: Value(createdAt),
    );
  }

  factory FavoritesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritesTableData(
      objectId: serializer.fromJson<String>(json['objectId']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'mediaType': serializer.toJson<String>(mediaType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoritesTableData copyWith(
          {String? objectId, String? mediaType, DateTime? createdAt}) =>
      FavoritesTableData(
        objectId: objectId ?? this.objectId,
        mediaType: mediaType ?? this.mediaType,
        createdAt: createdAt ?? this.createdAt,
      );
  FavoritesTableData copyWithCompanion(FavoritesTableCompanion data) {
    return FavoritesTableData(
      objectId: data.objectId.present ? data.objectId.value : this.objectId,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesTableData(')
          ..write('objectId: $objectId, ')
          ..write('mediaType: $mediaType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(objectId, mediaType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritesTableData &&
          other.objectId == this.objectId &&
          other.mediaType == this.mediaType &&
          other.createdAt == this.createdAt);
}

class FavoritesTableCompanion extends UpdateCompanion<FavoritesTableData> {
  final Value<String> objectId;
  final Value<String> mediaType;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FavoritesTableCompanion({
    this.objectId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesTableCompanion.insert({
    required String objectId,
    required String mediaType,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        mediaType = Value(mediaType),
        createdAt = Value(createdAt);
  static Insertable<FavoritesTableData> custom({
    Expression<String>? objectId,
    Expression<String>? mediaType,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (mediaType != null) 'media_type': mediaType,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesTableCompanion copyWith(
      {Value<String>? objectId,
      Value<String>? mediaType,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return FavoritesTableCompanion(
      objectId: objectId ?? this.objectId,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('mediaType: $mediaType, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AudiosTableTable audiosTable = $AudiosTableTable(this);
  late final $VideosTableTable videosTable = $VideosTableTable(this);
  late final $FavoritesTableTable favoritesTable = $FavoritesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [audiosTable, videosTable, favoritesTable];
}

typedef $$AudiosTableTableCreateCompanionBuilder = AudiosTableCompanion
    Function({
  required String objectId,
  required String title,
  Value<String?> subtitle,
  required String cover,
  required int duration,
  Value<String?> audioHq,
  required String cfUrl,
  required String hero,
  required int articleId,
  required String audio,
  required DateTime originalPubtime,
  Value<bool?> audioCaptionOk,
  required DateTime createdAt,
  required DateTime updatedAt,
  required String branchLink,
  required int likeCount,
  required int viewCount,
  required String aclJson,
  Value<int> rowid,
});
typedef $$AudiosTableTableUpdateCompanionBuilder = AudiosTableCompanion
    Function({
  Value<String> objectId,
  Value<String> title,
  Value<String?> subtitle,
  Value<String> cover,
  Value<int> duration,
  Value<String?> audioHq,
  Value<String> cfUrl,
  Value<String> hero,
  Value<int> articleId,
  Value<String> audio,
  Value<DateTime> originalPubtime,
  Value<bool?> audioCaptionOk,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> branchLink,
  Value<int> likeCount,
  Value<int> viewCount,
  Value<String> aclJson,
  Value<int> rowid,
});

class $$AudiosTableTableFilterComposer
    extends Composer<_$AppDatabase, $AudiosTableTable> {
  $$AudiosTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get objectId => $composableBuilder(
      column: $table.objectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cover => $composableBuilder(
      column: $table.cover, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioHq => $composableBuilder(
      column: $table.audioHq, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cfUrl => $composableBuilder(
      column: $table.cfUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hero => $composableBuilder(
      column: $table.hero, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get articleId => $composableBuilder(
      column: $table.articleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audio => $composableBuilder(
      column: $table.audio, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get originalPubtime => $composableBuilder(
      column: $table.originalPubtime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get audioCaptionOk => $composableBuilder(
      column: $table.audioCaptionOk,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchLink => $composableBuilder(
      column: $table.branchLink, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aclJson => $composableBuilder(
      column: $table.aclJson, builder: (column) => ColumnFilters(column));
}

class $$AudiosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AudiosTableTable> {
  $$AudiosTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get objectId => $composableBuilder(
      column: $table.objectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cover => $composableBuilder(
      column: $table.cover, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioHq => $composableBuilder(
      column: $table.audioHq, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cfUrl => $composableBuilder(
      column: $table.cfUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hero => $composableBuilder(
      column: $table.hero, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get articleId => $composableBuilder(
      column: $table.articleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audio => $composableBuilder(
      column: $table.audio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get originalPubtime => $composableBuilder(
      column: $table.originalPubtime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get audioCaptionOk => $composableBuilder(
      column: $table.audioCaptionOk,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchLink => $composableBuilder(
      column: $table.branchLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aclJson => $composableBuilder(
      column: $table.aclJson, builder: (column) => ColumnOrderings(column));
}

class $$AudiosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudiosTableTable> {
  $$AudiosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get objectId =>
      $composableBuilder(column: $table.objectId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get cover =>
      $composableBuilder(column: $table.cover, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get audioHq =>
      $composableBuilder(column: $table.audioHq, builder: (column) => column);

  GeneratedColumn<String> get cfUrl =>
      $composableBuilder(column: $table.cfUrl, builder: (column) => column);

  GeneratedColumn<String> get hero =>
      $composableBuilder(column: $table.hero, builder: (column) => column);

  GeneratedColumn<int> get articleId =>
      $composableBuilder(column: $table.articleId, builder: (column) => column);

  GeneratedColumn<String> get audio =>
      $composableBuilder(column: $table.audio, builder: (column) => column);

  GeneratedColumn<DateTime> get originalPubtime => $composableBuilder(
      column: $table.originalPubtime, builder: (column) => column);

  GeneratedColumn<bool> get audioCaptionOk => $composableBuilder(
      column: $table.audioCaptionOk, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get branchLink => $composableBuilder(
      column: $table.branchLink, builder: (column) => column);

  GeneratedColumn<int> get likeCount =>
      $composableBuilder(column: $table.likeCount, builder: (column) => column);

  GeneratedColumn<int> get viewCount =>
      $composableBuilder(column: $table.viewCount, builder: (column) => column);

  GeneratedColumn<String> get aclJson =>
      $composableBuilder(column: $table.aclJson, builder: (column) => column);
}

class $$AudiosTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AudiosTableTable,
    AudiosTableData,
    $$AudiosTableTableFilterComposer,
    $$AudiosTableTableOrderingComposer,
    $$AudiosTableTableAnnotationComposer,
    $$AudiosTableTableCreateCompanionBuilder,
    $$AudiosTableTableUpdateCompanionBuilder,
    (
      AudiosTableData,
      BaseReferences<_$AppDatabase, $AudiosTableTable, AudiosTableData>
    ),
    AudiosTableData,
    PrefetchHooks Function()> {
  $$AudiosTableTableTableManager(_$AppDatabase db, $AudiosTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudiosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudiosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudiosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> objectId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> subtitle = const Value.absent(),
            Value<String> cover = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<String?> audioHq = const Value.absent(),
            Value<String> cfUrl = const Value.absent(),
            Value<String> hero = const Value.absent(),
            Value<int> articleId = const Value.absent(),
            Value<String> audio = const Value.absent(),
            Value<DateTime> originalPubtime = const Value.absent(),
            Value<bool?> audioCaptionOk = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> branchLink = const Value.absent(),
            Value<int> likeCount = const Value.absent(),
            Value<int> viewCount = const Value.absent(),
            Value<String> aclJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AudiosTableCompanion(
            objectId: objectId,
            title: title,
            subtitle: subtitle,
            cover: cover,
            duration: duration,
            audioHq: audioHq,
            cfUrl: cfUrl,
            hero: hero,
            articleId: articleId,
            audio: audio,
            originalPubtime: originalPubtime,
            audioCaptionOk: audioCaptionOk,
            createdAt: createdAt,
            updatedAt: updatedAt,
            branchLink: branchLink,
            likeCount: likeCount,
            viewCount: viewCount,
            aclJson: aclJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String objectId,
            required String title,
            Value<String?> subtitle = const Value.absent(),
            required String cover,
            required int duration,
            Value<String?> audioHq = const Value.absent(),
            required String cfUrl,
            required String hero,
            required int articleId,
            required String audio,
            required DateTime originalPubtime,
            Value<bool?> audioCaptionOk = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            required String branchLink,
            required int likeCount,
            required int viewCount,
            required String aclJson,
            Value<int> rowid = const Value.absent(),
          }) =>
              AudiosTableCompanion.insert(
            objectId: objectId,
            title: title,
            subtitle: subtitle,
            cover: cover,
            duration: duration,
            audioHq: audioHq,
            cfUrl: cfUrl,
            hero: hero,
            articleId: articleId,
            audio: audio,
            originalPubtime: originalPubtime,
            audioCaptionOk: audioCaptionOk,
            createdAt: createdAt,
            updatedAt: updatedAt,
            branchLink: branchLink,
            likeCount: likeCount,
            viewCount: viewCount,
            aclJson: aclJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AudiosTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AudiosTableTable,
    AudiosTableData,
    $$AudiosTableTableFilterComposer,
    $$AudiosTableTableOrderingComposer,
    $$AudiosTableTableAnnotationComposer,
    $$AudiosTableTableCreateCompanionBuilder,
    $$AudiosTableTableUpdateCompanionBuilder,
    (
      AudiosTableData,
      BaseReferences<_$AppDatabase, $AudiosTableTable, AudiosTableData>
    ),
    AudiosTableData,
    PrefetchHooks Function()>;
typedef $$VideosTableTableCreateCompanionBuilder = VideosTableCompanion
    Function({
  required String objectId,
  required String title,
  Value<String?> subtitle,
  required String cover,
  required int duration,
  required String videoHq,
  required String videoUrl,
  required String ytUrl,
  required String videoMobile,
  required DateTime pubtime,
  required int videoId,
  required DateTime createdAt,
  required DateTime updatedAt,
  required String branchLink,
  required int likeCount,
  required int viewCount,
  required String aclJson,
  Value<int> rowid,
});
typedef $$VideosTableTableUpdateCompanionBuilder = VideosTableCompanion
    Function({
  Value<String> objectId,
  Value<String> title,
  Value<String?> subtitle,
  Value<String> cover,
  Value<int> duration,
  Value<String> videoHq,
  Value<String> videoUrl,
  Value<String> ytUrl,
  Value<String> videoMobile,
  Value<DateTime> pubtime,
  Value<int> videoId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> branchLink,
  Value<int> likeCount,
  Value<int> viewCount,
  Value<String> aclJson,
  Value<int> rowid,
});

class $$VideosTableTableFilterComposer
    extends Composer<_$AppDatabase, $VideosTableTable> {
  $$VideosTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get objectId => $composableBuilder(
      column: $table.objectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cover => $composableBuilder(
      column: $table.cover, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoHq => $composableBuilder(
      column: $table.videoHq, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ytUrl => $composableBuilder(
      column: $table.ytUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoMobile => $composableBuilder(
      column: $table.videoMobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get pubtime => $composableBuilder(
      column: $table.pubtime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchLink => $composableBuilder(
      column: $table.branchLink, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aclJson => $composableBuilder(
      column: $table.aclJson, builder: (column) => ColumnFilters(column));
}

class $$VideosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VideosTableTable> {
  $$VideosTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get objectId => $composableBuilder(
      column: $table.objectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cover => $composableBuilder(
      column: $table.cover, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoHq => $composableBuilder(
      column: $table.videoHq, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ytUrl => $composableBuilder(
      column: $table.ytUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoMobile => $composableBuilder(
      column: $table.videoMobile, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get pubtime => $composableBuilder(
      column: $table.pubtime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchLink => $composableBuilder(
      column: $table.branchLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aclJson => $composableBuilder(
      column: $table.aclJson, builder: (column) => ColumnOrderings(column));
}

class $$VideosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VideosTableTable> {
  $$VideosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get objectId =>
      $composableBuilder(column: $table.objectId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get cover =>
      $composableBuilder(column: $table.cover, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get videoHq =>
      $composableBuilder(column: $table.videoHq, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get ytUrl =>
      $composableBuilder(column: $table.ytUrl, builder: (column) => column);

  GeneratedColumn<String> get videoMobile => $composableBuilder(
      column: $table.videoMobile, builder: (column) => column);

  GeneratedColumn<DateTime> get pubtime =>
      $composableBuilder(column: $table.pubtime, builder: (column) => column);

  GeneratedColumn<int> get videoId =>
      $composableBuilder(column: $table.videoId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get branchLink => $composableBuilder(
      column: $table.branchLink, builder: (column) => column);

  GeneratedColumn<int> get likeCount =>
      $composableBuilder(column: $table.likeCount, builder: (column) => column);

  GeneratedColumn<int> get viewCount =>
      $composableBuilder(column: $table.viewCount, builder: (column) => column);

  GeneratedColumn<String> get aclJson =>
      $composableBuilder(column: $table.aclJson, builder: (column) => column);
}

class $$VideosTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VideosTableTable,
    VideosTableData,
    $$VideosTableTableFilterComposer,
    $$VideosTableTableOrderingComposer,
    $$VideosTableTableAnnotationComposer,
    $$VideosTableTableCreateCompanionBuilder,
    $$VideosTableTableUpdateCompanionBuilder,
    (
      VideosTableData,
      BaseReferences<_$AppDatabase, $VideosTableTable, VideosTableData>
    ),
    VideosTableData,
    PrefetchHooks Function()> {
  $$VideosTableTableTableManager(_$AppDatabase db, $VideosTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> objectId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> subtitle = const Value.absent(),
            Value<String> cover = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<String> videoHq = const Value.absent(),
            Value<String> videoUrl = const Value.absent(),
            Value<String> ytUrl = const Value.absent(),
            Value<String> videoMobile = const Value.absent(),
            Value<DateTime> pubtime = const Value.absent(),
            Value<int> videoId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> branchLink = const Value.absent(),
            Value<int> likeCount = const Value.absent(),
            Value<int> viewCount = const Value.absent(),
            Value<String> aclJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VideosTableCompanion(
            objectId: objectId,
            title: title,
            subtitle: subtitle,
            cover: cover,
            duration: duration,
            videoHq: videoHq,
            videoUrl: videoUrl,
            ytUrl: ytUrl,
            videoMobile: videoMobile,
            pubtime: pubtime,
            videoId: videoId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            branchLink: branchLink,
            likeCount: likeCount,
            viewCount: viewCount,
            aclJson: aclJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String objectId,
            required String title,
            Value<String?> subtitle = const Value.absent(),
            required String cover,
            required int duration,
            required String videoHq,
            required String videoUrl,
            required String ytUrl,
            required String videoMobile,
            required DateTime pubtime,
            required int videoId,
            required DateTime createdAt,
            required DateTime updatedAt,
            required String branchLink,
            required int likeCount,
            required int viewCount,
            required String aclJson,
            Value<int> rowid = const Value.absent(),
          }) =>
              VideosTableCompanion.insert(
            objectId: objectId,
            title: title,
            subtitle: subtitle,
            cover: cover,
            duration: duration,
            videoHq: videoHq,
            videoUrl: videoUrl,
            ytUrl: ytUrl,
            videoMobile: videoMobile,
            pubtime: pubtime,
            videoId: videoId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            branchLink: branchLink,
            likeCount: likeCount,
            viewCount: viewCount,
            aclJson: aclJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VideosTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VideosTableTable,
    VideosTableData,
    $$VideosTableTableFilterComposer,
    $$VideosTableTableOrderingComposer,
    $$VideosTableTableAnnotationComposer,
    $$VideosTableTableCreateCompanionBuilder,
    $$VideosTableTableUpdateCompanionBuilder,
    (
      VideosTableData,
      BaseReferences<_$AppDatabase, $VideosTableTable, VideosTableData>
    ),
    VideosTableData,
    PrefetchHooks Function()>;
typedef $$FavoritesTableTableCreateCompanionBuilder = FavoritesTableCompanion
    Function({
  required String objectId,
  required String mediaType,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$FavoritesTableTableUpdateCompanionBuilder = FavoritesTableCompanion
    Function({
  Value<String> objectId,
  Value<String> mediaType,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$FavoritesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get objectId => $composableBuilder(
      column: $table.objectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FavoritesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get objectId => $composableBuilder(
      column: $table.objectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaType => $composableBuilder(
      column: $table.mediaType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoritesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get objectId =>
      $composableBuilder(column: $table.objectId, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoritesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoritesTableTable,
    FavoritesTableData,
    $$FavoritesTableTableFilterComposer,
    $$FavoritesTableTableOrderingComposer,
    $$FavoritesTableTableAnnotationComposer,
    $$FavoritesTableTableCreateCompanionBuilder,
    $$FavoritesTableTableUpdateCompanionBuilder,
    (
      FavoritesTableData,
      BaseReferences<_$AppDatabase, $FavoritesTableTable, FavoritesTableData>
    ),
    FavoritesTableData,
    PrefetchHooks Function()> {
  $$FavoritesTableTableTableManager(
      _$AppDatabase db, $FavoritesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> objectId = const Value.absent(),
            Value<String> mediaType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoritesTableCompanion(
            objectId: objectId,
            mediaType: mediaType,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String objectId,
            required String mediaType,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoritesTableCompanion.insert(
            objectId: objectId,
            mediaType: mediaType,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoritesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoritesTableTable,
    FavoritesTableData,
    $$FavoritesTableTableFilterComposer,
    $$FavoritesTableTableOrderingComposer,
    $$FavoritesTableTableAnnotationComposer,
    $$FavoritesTableTableCreateCompanionBuilder,
    $$FavoritesTableTableUpdateCompanionBuilder,
    (
      FavoritesTableData,
      BaseReferences<_$AppDatabase, $FavoritesTableTable, FavoritesTableData>
    ),
    FavoritesTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AudiosTableTableTableManager get audiosTable =>
      $$AudiosTableTableTableManager(_db, _db.audiosTable);
  $$VideosTableTableTableManager get videosTable =>
      $$VideosTableTableTableManager(_db, _db.videosTable);
  $$FavoritesTableTableTableManager get favoritesTable =>
      $$FavoritesTableTableTableManager(_db, _db.favoritesTable);
}
