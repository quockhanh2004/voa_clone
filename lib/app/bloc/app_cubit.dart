import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:voa_clone/app/bloc/app_state.dart';
import 'package:voa_clone/model/settings_app/detail_setting.dart';

class AppCubit extends HydratedCubit<AppState> {
  AppCubit()
      : super(
          AppState(
            detailSetting: DetailSetting(
              bgColor: BackgroundColorDetail.WHITE,
              textSize: 100,
            ),
          ),
        );

  void updateTheme(bool isDarkMode) {
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  void updateDetailSetting(DetailSetting detailSetting) {
    emit(state.copyWith(detailSetting: detailSetting));
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      return AppState.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }
}
