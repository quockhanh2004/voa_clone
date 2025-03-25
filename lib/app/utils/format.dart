import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final formatter = DateFormat('MMMM dd, yyyy');
  return formatter.format(dateTime);
}

String formatDuration(int seconds) {
  final hours = seconds ~/ 3600;
  final minutes = (seconds % 3600) ~/ 60;
  final remainingSeconds = seconds % 60;

  if (hours > 0) {
    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  } else if (minutes > 0) {
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  } else {
    return remainingSeconds.toString();
  }
}

String formatDurationMedia(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}
