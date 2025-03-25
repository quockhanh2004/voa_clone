import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/media/media_cubit.dart';
import 'package:voa_clone/app/bloc/media/media_state.dart';
import 'package:voa_clone/app/utils/format.dart';
import 'package:voa_clone/model/media.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/model/response_video.dart';

class AudioPlayerWidget extends StatelessWidget {
  final Media media;
  final String? htmlContent;

  const AudioPlayerWidget({super.key, required this.media, this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        final cubit = context.read<MediaCubit>();
        if (media.objectId != state.media?.objectId) {
          cubit.stop();
        }
        if (state.media is Audio) {
          cubit.setMedia(media as Audio);
        } else {
          cubit.setMedia(media as Video);

        }
        return Container(
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDurationMedia(state.position),
                      style: const TextStyle(color: Colors.white),
                    ),
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
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          max: state.duration.inSeconds.toDouble(),
                          value: state.position.inSeconds.toDouble(),
                          onChanged: (value) => cubit.seekTo(value),
                        ),
                      ),
                    ),
                    Text(
                      formatDurationMedia(state.duration),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconTheme(
                data: const IconThemeData(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, size: 25),
                    ),
                    IconButton(
                      onPressed: cubit.replay5,
                      icon: const Icon(Icons.replay_5, size: 25),
                    ),
                    IconButton(
                      iconSize: 60,
                      icon: Icon(
                        state.playerState == PlayerState.playing
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                      onPressed: () {
                        if (state.playerState == PlayerState.playing) {
                          cubit.pause();
                        } else {
                          cubit.play();
                        }
                      },
                    ),
                    IconButton(
                      onPressed: cubit.forward5,
                      icon: const Icon(Icons.forward_5, size: 25),
                    ),
                    IconButton(
                      onPressed: () {
                        cubit.changePlayBackRate();
                      },
                      icon: Text(
                        "${state.playbackRate}x",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
