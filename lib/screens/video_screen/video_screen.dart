import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:voa_clone/app/bloc/media/media_cubit.dart';
import 'package:voa_clone/app/bloc/media/media_state.dart';
import 'package:voa_clone/app/utils/format.dart';
import 'package:voa_clone/model/response_video.dart';

class VideoPlayerScreen extends StatelessWidget {
  final Video video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final mediaCubit = context.read<MediaCubit>();

    if (mediaCubit.videoController == null ||
        mediaCubit.videoController?.dataSource != video.videoUrl) {
      mediaCubit.setMedia(video);
    }

    return BlocProvider.value(
      value: mediaCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text("Video Player")),
        body: BlocBuilder<MediaCubit, MediaState>(
          builder: (context, state) {
            final cubit = context.read<MediaCubit>();
            final videoController = cubit.videoController;

            if (videoController == null ||
                !videoController.value.isInitialized) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(videoController),
                    ),
                  ),
                ),
                _buildControls(context, state, videoController),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildControls(
    BuildContext context,
    MediaState state,
    VideoPlayerController videoController,
  ) {
    final cubit = context.read<MediaCubit>();
    final durationInSeconds =
        videoController.value.duration.inSeconds.toDouble();
    final positionInSeconds = state.position.inSeconds.toDouble();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDurationMedia(state.position)),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6.0,
                    ),
                  ),
                  child: Slider(
                    min: 0,
                    max: durationInSeconds > 0 ? durationInSeconds : 1,
                    value: positionInSeconds.clamp(0, durationInSeconds),
                    onChanged: (value) => cubit.seekTo(value),
                  ),
                ),
              ),
              Text(formatDurationMedia(videoController.value.duration)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            IconButton(
              icon: const Icon(Icons.replay_5),
              onPressed: cubit.replay5,
            ),
            IconButton(
              icon: Icon(
                state.playerState == PlayerState.playing
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
              onPressed: () {
                state.playerState == PlayerState.playing
                    ? cubit.pause()
                    : cubit.play();
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_5),
              onPressed: cubit.forward5,
            ),
            IconButton(
              onPressed: cubit.changePlayBackRate,
              icon: Text(
                "${state.playbackRate}x",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
