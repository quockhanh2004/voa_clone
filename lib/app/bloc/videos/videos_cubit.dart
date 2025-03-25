import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/videos/videos_state.dart';
import 'package:voa_clone/app/database/database.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/app/services/video_service.dart';
import 'package:voa_clone/model/response_video.dart';

class VideosCubit extends Cubit<VideosState> {
  final VideoService _videoService;
  final AppDatabase _database;

  VideosCubit(this._database)
    : _videoService = VideoService(),
      super(const VideosState());

  Future<void> fetchVideos() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final ResponseVideo response = await _videoService.getListVideo();
      // Lưu vào database
      for (var video in response.results) {
        await _database.insertVideo(video);
      }
      emit(state.copyWith(loadStatus: LoadStatus.success, videosRe: response));
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }

  Future<void> loadCachedVideos() async {
    try {
      final cachedVideos = await _database.getAllVideos();
      if (cachedVideos.isNotEmpty) {
        final response = ResponseVideo(results: cachedVideos);
        emit(
          state.copyWith(loadStatus: LoadStatus.success, videosRe: response),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading cached videos: $e');
      }
    }
  }
}
