import 'package:flutter/material.dart';
import 'package:voa_clone/model/lyric.dart';

class LyricView extends StatelessWidget {
  final List<Lyric> lyrics;
  final Duration currentPosition;
  final ScrollController? scrollController;

  const LyricView({
    super.key,
    required this.lyrics,
    required this.currentPosition,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    if (lyrics.isEmpty) return const SizedBox.shrink();

    // Tìm lyric hiện tại
    final currentLyric = lyrics.firstWhere(
      (lyric) => lyric.timestamp > currentPosition,
      orElse: () => lyrics.last,
    );

    // Tìm index của lyric hiện tại
    final currentIndex = lyrics.indexOf(currentLyric);

    return ListView.builder(
      controller: scrollController,
      itemCount: lyrics.length,
      itemBuilder: (context, index) {
        final lyric = lyrics[index];
        final isActive = index == currentIndex;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            lyric.text,
            style: TextStyle(
              fontSize: isActive ? 18 : 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.white : Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
