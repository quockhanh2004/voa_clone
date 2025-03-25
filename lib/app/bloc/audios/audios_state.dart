import 'package:equatable/equatable.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/model/response_audio.dart';

class AudiosState extends Equatable {
  final LoadStatus loadStatus;
  final ResponseAudio? audiosRe;

  const AudiosState({this.loadStatus = LoadStatus.initial, this.audiosRe});

  AudiosState copyWith({LoadStatus? loadStatus, ResponseAudio? audiosRe}) {
    return AudiosState(
      loadStatus: loadStatus ?? this.loadStatus,
      audiosRe: audiosRe ?? this.audiosRe,
    );
  }

  @override
  List<Object?> get props => [loadStatus, audiosRe];
}
