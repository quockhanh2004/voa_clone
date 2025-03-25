import 'package:equatable/equatable.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/model/response_video.dart';

class VideosState extends Equatable {
  final LoadStatus loadStatus;
  final ResponseVideo? videosRe;

  const VideosState({
    this.loadStatus = LoadStatus.initial,
    this.videosRe,
  });

  @override
  List<Object?> get props => [loadStatus, videosRe];

  VideosState copyWith({LoadStatus? loadStatus, ResponseVideo? videosRe}) {
    return VideosState(
      videosRe: videosRe ?? this.videosRe,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}
