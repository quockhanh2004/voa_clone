import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/audios/audios_state.dart';
import 'package:voa_clone/app/database/database.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/app/services/audio_service.dart';
import 'package:voa_clone/model/response_audio.dart';

class AudiosCubit extends Cubit<AudiosState> {
  final AudioService _audioService;
  final AppDatabase _database;

  AudiosCubit(this._database)
      : _audioService = AudioService(),
        super(const AudiosState());

  Future<void> fetchAudios() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final ResponseAudio response = await _audioService.getAudios();
      // Lưu vào database
      // for (var audio in response.results) {
      //   await _database.insertAudio(audio);
      // }
      emit(state.copyWith(
        loadStatus: LoadStatus.success,
        audiosRe: response,
      ));
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }

  Future<void> loadCachedAudios() async {
    try {
      final cachedAudios = await _database.getAllAudios();
      if (cachedAudios.isNotEmpty) {
        final response = ResponseAudio(results: cachedAudios);
        emit(state.copyWith(
          loadStatus: LoadStatus.success,
          audiosRe: response,
        ));
      }
    } catch (e) {
      print('Error loading cached audios: $e');
    }
  }
}
