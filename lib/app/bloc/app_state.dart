import 'package:equatable/equatable.dart';
import 'package:voa_clone/model/settings_app/detail_setting.dart';

class AppState extends Equatable {
  final bool isDarkMode;
  final DetailSetting detailSetting;

  const AppState({this.isDarkMode = false, required this.detailSetting});

  AppState copyWith({bool? isDarkMode, DetailSetting? detailSetting}) {
    return AppState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      detailSetting: detailSetting ?? this.detailSetting,
    );
  }

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      detailSetting: DetailSetting.fromJson(
        json['detailSetting'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'isDarkMode': isDarkMode, 'detailSetting': detailSetting.toJson()};
  }

  @override
  List<Object> get props => [isDarkMode, detailSetting];
}
