import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/model/media.dart';
import 'package:voa_clone/model/lyric.dart';

class MediaState extends Equatable {
  final Media? media;
  final Duration position;
  final Duration duration;
  final PlayerState playerState;
  final double playbackRate;
  final List<Lyric> lyrics;
  final LoadStatus lyricsLoadStatus;
  final bool isActive;

  const MediaState({
    this.media,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.playerState = PlayerState.stopped,
    this.playbackRate = 1.0,
    this.lyrics = const [],
    this.lyricsLoadStatus = LoadStatus.initial,
    this.isActive = false,
  });

  @override
  List<Object?> get props => [
    media,
    position,
    duration,
    playerState,
    playbackRate,
    lyrics,
    lyricsLoadStatus,
    isActive,
  ];

  MediaState copyWith({
    Media? media,
    Duration? position,
    Duration? duration,
    PlayerState? playerState,
    double? playbackRate,
    List<Lyric>? lyrics,
    LoadStatus? lyricsLoadStatus,
    bool? isActive,
  }) {
    return MediaState(
      media: media ?? this.media,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      playerState: playerState ?? this.playerState,
      playbackRate: playbackRate ?? this.playbackRate,
      lyrics: lyrics ?? this.lyrics,
      lyricsLoadStatus: lyricsLoadStatus ?? this.lyricsLoadStatus,
      isActive: isActive ?? this.isActive,
    );
  }
}
