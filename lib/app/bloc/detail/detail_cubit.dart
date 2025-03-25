import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/detail/detail_state.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/app/services/detail_service.dart';

class DetailCubit extends Cubit<DetailState> {
  final DetailService _detailService;

  DetailCubit(this._detailService) : super(const DetailState());

  Future<void> loadHtmlContent(String url) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final htmlContent = await _detailService.getHtmlContent(url);
      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          htmlContent: htmlContent,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }
}
