import 'package:equatable/equatable.dart';

class Lyric extends Equatable {
  final Duration timestamp;
  final String text;
  final Duration? duration;

  const Lyric({required this.timestamp, required this.text, this.duration});

  factory Lyric.fromJson(Map<String, dynamic> json) => Lyric(
    timestamp: Duration(milliseconds: json['timestamp']),
    text: json['text'],
    duration:
        json['duration'] != null
            ? Duration(milliseconds: json['duration'])
            : null,
  );

  Map<String, dynamic> toJson() => {
    'timestamp': timestamp.inMilliseconds,
    'text': text,
    'duration': duration?.inMilliseconds,
  };

  @override
  List<Object?> get props => [timestamp, text, duration];
}
