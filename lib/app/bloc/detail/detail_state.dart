import 'package:equatable/equatable.dart';
import 'package:voa_clone/app/enums/load_status.dart';

class DetailState extends Equatable {
  final LoadStatus loadStatus;
  final String? htmlContent;
  final String? cfUrl;

  const DetailState({
    this.loadStatus = LoadStatus.initial,
    this.htmlContent,
    this.cfUrl,
  });

  DetailState copyWith({
    LoadStatus? loadStatus,
    String? htmlContent,
    String? cfUrl,
  }) {
    return DetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      htmlContent: htmlContent ?? this.htmlContent,
      cfUrl: cfUrl ?? this.cfUrl,
    );
  }

  @override
  List<Object?> get props => [loadStatus, htmlContent, cfUrl];
}
