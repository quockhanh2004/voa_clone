import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voa_clone/app/bloc/videos/videos_cubit.dart';
import 'package:voa_clone/app/bloc/videos/videos_state.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/widgets/main_item.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final VideosCubit _videosCubit;

  @override
  void initState() {
    super.initState();
    _videosCubit = BlocProvider.of<VideosCubit>(context);
    _videosCubit.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideosCubit, VideosState>(
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadStatus == LoadStatus.success) {
            if (state.videosRe != null && state.videosRe!.results.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async => await _videosCubit.fetchVideos(),
                child: ListView.builder(
                  itemCount: state.videosRe?.results.length ?? 0,
                  itemBuilder: (context, index) {
                    return MainItem(
                      media: state.videosRe!.results[index],
                      onTap: () {
                        context.push(
                          '/video',
                          extra: state.videosRe!.results[index],
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text("No videos found"));
            }
          } else if (state.loadStatus == LoadStatus.failure) {
            return const Center(child: Text("Error loading videos"));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
