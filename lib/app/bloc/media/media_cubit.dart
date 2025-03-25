import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:voa_clone/app/bloc/media/media_state.dart';
import 'package:voa_clone/model/media.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/model/response_video.dart';

class MediaCubit extends Cubit<MediaState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  VideoPlayerController? _videoController;

  MediaCubit() : super(const MediaState()) {
    _initAudioPlayer();
  }

  VideoPlayerController? get videoController => _videoController;

  void _initAudioPlayer() {
    _audioPlayer.onDurationChanged.listen((duration) {
      emit(state.copyWith(duration: duration));
    });

    _audioPlayer.onPositionChanged.listen((position) {
      emit(state.copyWith(position: position));
    });

    _audioPlayer.onPlayerStateChanged.listen((playerState) {
      emit(state.copyWith(playerState: playerState));
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      emit(
        state.copyWith(
          position: Duration.zero,
          isActive: false,
          playerState: PlayerState.stopped,
        ),
      );
    });
  }

  Future<void> setMedia(Media media) async {
    try {
      await _audioPlayer.stop();
      await _videoController?.dispose();

      emit(
        state.copyWith(
          media: media,
          position: Duration.zero,
          duration: Duration.zero,
          playerState: PlayerState.stopped,
          isActive: true,
        ),
      );

      if (media is Audio) {
        await _audioPlayer.setSource(UrlSource(media.audio));
        await _audioPlayer.seek(Duration.zero);
      } else if (media is Video) {
        _videoController = VideoPlayerController.networkUrl(
            Uri.parse(media.videoUrl),
          )
          ..initialize().then((_) {
            emit(state.copyWith(duration: _videoController!.value.duration));
            videoController!.addListener(updatePosition);
            play();
          });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading media: $e');
      }
    }
  }

  Future<void> play() async {
    if (state.media is Audio) {
      await _audioPlayer.resume();
    } else if (state.media is Video && _videoController != null) {
      _videoController!.play();
    }
    emit(state.copyWith(isActive: true, playerState: PlayerState.playing));
  }

  Future<void> pause() async {
    if (state.media is Audio) {
      await _audioPlayer.pause();
    } else if (state.media is Video && _videoController != null) {
      _videoController!.pause();
    }
    emit(state.copyWith(playerState: PlayerState.paused));
  }

  Future<void> stop() async {
    if (state.media is Audio) {
      await _audioPlayer.stop();
    } else if (state.media is Video && _videoController != null) {
      await _videoController!.pause();
      await _videoController!.seekTo(Duration.zero);
    }
    emit(
      state.copyWith(
        position: Duration.zero,
        isActive: false,
        playerState: PlayerState.stopped,
      ),
    );
  }

  Future<void> seekTo(double seconds) async {
    final newPosition = Duration(seconds: seconds.toInt());
    if (state.media is Audio) {
      await _audioPlayer.seek(newPosition);
    } else if (state.media is Video && _videoController != null) {
      await _videoController!.seekTo(newPosition);
    }
    emit(state.copyWith(position: newPosition));
  }

  Future<void> replay5() async {
    final newPosition = (state.position - const Duration(seconds: 5)).inSeconds
        .clamp(0, state.duration.inSeconds);
    await seekTo(newPosition.toDouble());
  }

  Future<void> forward5() async {
    final newPosition = (state.position + const Duration(seconds: 5)).inSeconds
        .clamp(0, state.duration.inSeconds);
    await seekTo(newPosition.toDouble());
  }

  void changePlayBackRate() {
    final rates = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
    final currentIndex = rates.indexOf(state.playbackRate);
    final nextIndex = (currentIndex + 1) % rates.length;

    if (state.media is Audio) {
      _audioPlayer.setPlaybackRate(rates[nextIndex]);
    } else if (state.media is Video && _videoController != null) {
      _videoController!.setPlaybackSpeed(rates[nextIndex]);
    }

    emit(state.copyWith(playbackRate: rates[nextIndex]));
  }

  void updatePosition() {
    final position = videoController?.value.position ?? Duration.zero;
    emit(state.copyWith(position: position));
  }

  @override
  Future<void> close() async {
    await _audioPlayer.dispose();
    await _videoController?.dispose();
    return super.close();
  }
}
