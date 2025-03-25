// widgets/media_active.dart
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voa_clone/app/bloc/media/media_cubit.dart';
import 'package:voa_clone/app/bloc/media/media_state.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/widgets/cached_image.dart';

class MediaActive extends StatelessWidget {
  // Thêm tham số để biết đang ở màn hình nào
  final bool isDetailScreen;

  const MediaActive({super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        if (!state.isActive || state.media == null) {
          print(
            'MediaActive hidden: isActive=${state.isActive}, media=${state.media != null}',
          );
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: () {
            if (state.media is Audio) {
              context.push("/detail", extra: state.media);
            } else {
              context.push("/video", extra: state.media);
            }
          },
          child: Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CachedImage(
                  imageUrl: state.media!.cover,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.media!.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state.media is Audio
                            ? "Latest Audios"
                            : "Latest Videos",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    state.playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 24,
                  ),
                  onPressed: () {
                    final mediaCubit = BlocProvider.of<MediaCubit>(context);
                    if (state.playerState == PlayerState.playing) {
                      mediaCubit.pause();
                    } else {
                      mediaCubit.play();
                    }
                  },
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<MediaCubit>(context).stop();
                  },
                  icon: const Icon(Icons.clear, size: 24),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
