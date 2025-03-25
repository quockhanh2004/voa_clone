import 'package:equatable/equatable.dart';

class DetailSetting extends Equatable {
  final BackgroundColorDetail bgColor;
  final int textSize;

  const DetailSetting({required this.bgColor, required this.textSize});

  DetailSetting copyWith({
    BackgroundColorDetail? bgColor,
    int? textSize,
  }) {
    return DetailSetting(
      bgColor: bgColor ?? this.bgColor,
      textSize: textSize ?? this.textSize,
    );
  }

  factory DetailSetting.fromJson(Map<String, dynamic> json) {
    return DetailSetting(
      bgColor: BackgroundColorDetail.values.firstWhere(
        (e) => e.toString() == json['bgColor'],
        orElse: () => BackgroundColorDetail.WHITE,
      ),
      textSize: json['textSize'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'bgColor': bgColor.toString(), 'textSize': textSize};
  }

  @override
  List<Object> get props => [bgColor, textSize];
}

enum BackgroundColorDetail { BLACK, WHITE, SEPIA }