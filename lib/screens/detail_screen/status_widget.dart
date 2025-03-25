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
    Key? key,
    required this.audio,
    required this.state,
    required this.appState,
    required this.scrollController,
  }) : super(key: key);

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
        print('🎵 Current lyrics status: ${mediaState.lyricsLoadStatus}');
        print('🎵 Number of lyrics: ${mediaState.lyrics.length}');
        print('🎵 Current position: ${mediaState.position}');

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
            print('❌ Error highlighting lyrics: $e');
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

  void _scrollToCurrentLyric(Lyric currentLyric) {
    if (!widget.scrollController.hasClients) {
      print('❌ ScrollController has no clients');
      return;
    }

    try {
      // Tìm tất cả các phần tử mark trong HTML
      final elements = context.findRenderObject() as RenderBox?;
      if (elements == null) {
        print('❌ RenderBox not found');
        return;
      }

      // Tìm vị trí của text được highlight
      final pattern = RegExp(RegExp.escape(currentLyric.text));
      final match = pattern.firstMatch(widget.state.htmlContent ?? '');

      if (match != null) {
        // Tính toán vị trí scroll dựa trên viewport
        final viewportHeight = MediaQuery.of(context).size.height;
        final contentHeight = elements.size.height;

        // Ước tính vị trí tương đối của text trong nội dung
        final startIndex = match.start;
        final totalLength = widget.state.htmlContent?.length ?? 1;
        final relativePosition = startIndex / totalLength;

        // Tính toán vị trí scroll thực tế
        final estimatedPosition = contentHeight * relativePosition;

        // Điều chỉnh vị trí để text nằm ở 1/3 màn hình
        final targetPosition = estimatedPosition - (viewportHeight / 3);

        // Đảm bảo vị trí scroll nằm trong giới hạn cho phép
        final finalPosition = targetPosition.clamp(
          0.0,
          widget.scrollController.position.maxScrollExtent,
        );

        print(
          '📜 Scroll to position: $finalPosition (estimated: $estimatedPosition)',
        );

        widget.scrollController.animateTo(
          finalPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        print('❌ No match found for text: ${currentLyric.text}');
      }
    } catch (e) {
      print('❌ Scroll error: $e');
    }
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
