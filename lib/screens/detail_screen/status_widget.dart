import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/app_state.dart';
import 'package:voa_clone/app/bloc/detail/detail_state.dart';
import 'package:voa_clone/app/bloc/media/media_cubit.dart';
import 'package:voa_clone/app/bloc/media/media_state.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/model/settings_app/detail_setting.dart';
import 'package:voa_clone/model/lyric.dart';
import 'package:voa_clone/widgets/audio_player.dart';

class DetailSuccessView extends StatefulWidget {
  final Audio audio;
  final DetailState state;
  final AppState appState;
  final ScrollController scrollController;

  const DetailSuccessView({
    super.key,
    required this.audio,
    required this.state,
    required this.appState,
    required this.scrollController,
  });

  @override
  State<DetailSuccessView> createState() => _DetailSuccessViewState();
}

class _DetailSuccessViewState extends State<DetailSuccessView> {
  Lyric? _lastActiveLyric;
  List<Lyric>? _sortedLyrics;
  String? _lastContent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, mediaState) {
        if (kDebugMode) {
          print('🎵 Current lyrics status: ${mediaState.lyricsLoadStatus}');
          print('🎵 Number of lyrics: ${mediaState.lyrics.length}');
          print('🎵 Current position: ${mediaState.position}');
        }

        String highlightedHtml = widget.state.htmlContent ?? '';

        if (mediaState.lyrics.isNotEmpty &&
            mediaState.lyricsLoadStatus == LoadStatus.success) {
          try {
            // Chỉ sắp xếp lại lyrics khi nội dung thay đổi
            if (_lastContent != widget.state.htmlContent) {
              _sortedLyrics = List.from(mediaState.lyrics)
                ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
              _lastContent = widget.state.htmlContent;
            }

            if (_sortedLyrics != null && _sortedLyrics!.isNotEmpty) {
              // Tìm lyric hiện tại dựa trên thời gian phát
              final currentLyric = _sortedLyrics!.lastWhere(
                (lyric) => lyric.timestamp <= mediaState.position,
                orElse: () => _sortedLyrics!.first,
              );

              if (currentLyric.text.isNotEmpty) {
                // Thay thế text của lyric hiện tại bằng text được highlight
                highlightedHtml =
                    widget.state.htmlContent?.replaceAll(
                      currentLyric.text,
                      '<mark style="background-color: yellow; color: black;">${currentLyric.text}</mark>',
                    ) ??
                    '';

                // Chỉ cuộn khi chuyển sang lyric mới
                if (_lastActiveLyric?.text != currentLyric.text) {
                  _lastActiveLyric = currentLyric;
                  // Tắt tính năng tự động scroll
                  // Future.delayed(const Duration(milliseconds: 100), () {
                  //   _scrollToCurrentLyric(currentLyric);
                  // });
                }
              }
            }
          } catch (e) {
            if (kDebugMode) {
              print('❌ Error highlighting lyrics: $e');
            }
          }
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: widget.scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        widget.appState.detailSetting.bgColor ==
                                BackgroundColorDetail.WHITE
                            ? Colors.white
                            : widget.appState.detailSetting.bgColor ==
                                BackgroundColorDetail.BLACK
                            ? Colors.black
                            : Colors.amber[50],
                  ),
                  child: Html(
                    data: highlightedHtml,
                    style: {
                      "body": Style(
                        fontSize: FontSize(
                          16 * (widget.appState.detailSetting.textSize / 100),
                        ),
                        color:
                            widget.appState.detailSetting.bgColor ==
                                    BackgroundColorDetail.BLACK
                                ? Colors.white
                                : Colors.black,
                      ),
                      "mark": Style(
                        backgroundColor: Colors.yellow,
                        color: Colors.black,
                      ),
                    },
                  ),
                ),
              ),
            ),
            AudioPlayerWidget(
              media: widget.audio,
              htmlContent: widget.state.htmlContent,
            ),
          ],
        );
      },
    );
  }
}

class DetailLoadingView extends StatelessWidget {
  const DetailLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

// Widget hiển thị khi trạng thái là error
class DetailErrorView extends StatelessWidget {
  const DetailErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Error loading HTML'));
  }
}

// Widget hiển thị khi trạng thái là initial (hoặc default)
class DetailInitialView extends StatelessWidget {
  const DetailInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
