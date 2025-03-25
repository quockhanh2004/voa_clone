import 'dart:io';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:voa_clone/model/media.dart' hide typeValues;
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/model/response_video.dart';

part 'database.g.dart';

// Định nghĩa bảng Audio
class AudiosTable extends Table {
  TextColumn get objectId => text()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().nullable()();
  TextColumn get cover => text()();
  IntColumn get duration => integer()();
  TextColumn get audioHq => text().nullable()();
  TextColumn get cfUrl => text()();
  TextColumn get hero => text()();
  IntColumn get articleId => integer()();
  TextColumn get audio => text()();
  DateTimeColumn get originalPubtime => dateTime()();
  BoolColumn get audioCaptionOk => boolean().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get branchLink => text()();
  IntColumn get likeCount => integer()();
  IntColumn get viewCount => integer()();
  TextColumn get aclJson => text()(); // Lưu ACL dưới dạng JSON string

  @override
  Set<Column> get primaryKey => {objectId};
}

// Định nghĩa bảng Video
class VideosTable extends Table {
  TextColumn get objectId => text()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().nullable()();
  TextColumn get cover => text()();
  IntColumn get duration => integer()();
  TextColumn get videoHq => text()();
  TextColumn get videoUrl => text()();
  TextColumn get ytUrl => text()();
  TextColumn get videoMobile => text()();
  DateTimeColumn get pubtime => dateTime()();
  IntColumn get videoId => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get branchLink => text()();
  IntColumn get likeCount => integer()();
  IntColumn get viewCount => integer()();
  TextColumn get aclJson => text()(); // Lưu ACL dưới dạng JSON string

  @override
  Set<Column> get primaryKey => {objectId};
}

// Định nghĩa bảng Favorites
class FavoritesTable extends Table {
  TextColumn get objectId => text()();
  TextColumn get mediaType => text()(); // 'audio' hoặc 'video'
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {objectId};
}

@DriftDatabase(tables: [AudiosTable, VideosTable, FavoritesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Phương thức để lưu Audio
  Future<void> insertAudio(Audio audio) async {
    // await into(audiosTable).insert(companion, mode: InsertMode.replace);
  }

  // Phương thức để lưu Video
  Future<void> insertVideo(Video video) async {
    await into(videosTable).insert(
      VideosTableCompanion.insert(
        objectId: video.objectId,
        title: video.title,
        subtitle: Value(video.subtitle ?? ''),
        cover: video.cover,
        duration: video.duration,
        videoHq: video.videoHq,
        videoUrl: video.videoUrl,
        ytUrl: video.ytUrl,
        videoMobile: video.videoMobile,
        pubtime: video.pubtime.iso,
        videoId: video.videoId,
        createdAt: video.createdAt,
        updatedAt: video.updatedAt,
        branchLink: video.branchLink,
        likeCount: video.likeCount,
        viewCount: video.viewCount,
        aclJson: jsonEncode(video.acl.toJson()),
      ),
      mode: InsertMode.replace,
    );
  }

  // Phương thức để lấy tất cả Audio
  Future<List<Audio>> getAllAudios() async {
    final results = await select(audiosTable).get();
    return results.map((row) {
      return Audio(
        objectId: row.objectId,
        title: row.title,
        subtitle: row.subtitle,
        cover: row.cover,
        duration: row.duration,
        audioHq: row.audioHq,
        cfUrl: row.cfUrl,
        hero: row.hero,
        articleId: row.articleId,
        audio: row.audio,
        originalPubtime: OriginalPubtime(
          type: PubtimeType.date,
          iso: row.originalPubtime,
        ),
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        branchLink: row.branchLink,
        likeCount: row.likeCount,
        viewCount: row.viewCount,
        acl: Acl.fromJson(jsonDecode(row.aclJson)),
      );
    }).toList();
  }

  // Phương thức để lấy tất cả Video
  Future<List<Video>> getAllVideos() async {
    final results = await select(videosTable).get();
    return results.map((row) {
      return Video(
        objectId: row.objectId,
        title: row.title,
        subtitle: row.subtitle,
        cover: row.cover,
        duration: row.duration,
        videoHq: row.videoHq,
        videoUrl: row.videoUrl,
        ytUrl: row.ytUrl,
        videoMobile: row.videoMobile,
        pubtime: Pubtime(type: PubtimeType.date, iso: row.pubtime),
        videoId: row.videoId,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        branchLink: row.branchLink,
        likeCount: row.likeCount,
        viewCount: row.viewCount,
        acl: Acl.fromJson(jsonDecode(row.aclJson)),
      );
    }).toList();
  }

  // Phương thức để xóa tất cả Audio
  Future<void> deleteAllAudios() => delete(audiosTable).go();

  // Phương thức để xóa tất cả Video
  Future<void> deleteAllVideos() => delete(videosTable).go();

  // Phương thức để thêm favorite
  Future<void> addFavorite(Media media) async {
    await into(favoritesTable).insert(
      FavoritesTableCompanion.insert(
        objectId: media.objectId,
        mediaType: media is Audio ? 'audio' : 'video',
        createdAt: DateTime.now(),
      ),
    );
  }

  // Phương thức để xóa favorite
  Future<void> removeFavorite(String objectId) async {
    await (delete(favoritesTable)
      ..where((t) => t.objectId.equals(objectId))).go();
  }

  // Phương thức để kiểm tra favorite
  Future<bool> isFavorite(String objectId) async {
    final count =
        await (select(favoritesTable)
          ..where((t) => t.objectId.equals(objectId))).get();
    return count.isNotEmpty;
  }

  // Phương thức để lấy tất cả favorites
  Future<List<Media>> getAllFavorites() async {
    final favorites = await select(favoritesTable).get();
    final List<Media> result = [];

    for (var favorite in favorites) {
      if (favorite.mediaType == 'audio') {
        final audio =
            await (select(audiosTable)
              ..where((t) => t.objectId.equals(favorite.objectId))).getSingle();
        result.add(
          Audio(
            objectId: audio.objectId,
            title: audio.title,
            subtitle: audio.subtitle,
            cover: audio.cover,
            duration: audio.duration,
            audioHq: audio.audioHq,
            cfUrl: audio.cfUrl,
            hero: audio.hero,
            articleId: audio.articleId,
            audio: audio.audio,
            originalPubtime: OriginalPubtime(
              type: PubtimeType.date,
              iso: audio.originalPubtime,
            ),
            createdAt: audio.createdAt,
            updatedAt: audio.updatedAt,
            branchLink: audio.branchLink,
            likeCount: audio.likeCount,
            viewCount: audio.viewCount,
            acl: Acl.fromJson(jsonDecode(audio.aclJson)),
          ),
        );
      } else {
        final video =
            await (select(videosTable)
              ..where((t) => t.objectId.equals(favorite.objectId))).getSingle();
        result.add(
          Video(
            objectId: video.objectId,
            title: video.title,
            subtitle: video.subtitle,
            cover: video.cover,
            duration: video.duration,
            videoHq: video.videoHq,
            videoUrl: video.videoUrl,
            ytUrl: video.ytUrl,
            videoMobile: video.videoMobile,
            pubtime: Pubtime(type: PubtimeType.date, iso: video.pubtime),
            videoId: video.videoId,
            createdAt: video.createdAt,
            updatedAt: video.updatedAt,
            branchLink: video.branchLink,
            likeCount: video.likeCount,
            viewCount: video.viewCount,
            acl: Acl.fromJson(jsonDecode(video.aclJson)),
          ),
        );
      }
    }

    return result;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'voa_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
