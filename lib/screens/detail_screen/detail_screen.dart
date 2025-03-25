// detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/app_cubit.dart';
import 'package:voa_clone/app/bloc/detail/detail_cubit.dart';
import 'package:voa_clone/app/bloc/detail/detail_state.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/app/services/detail_service.dart';
import 'package:voa_clone/screens/detail_screen/status_widget.dart';
import 'package:voa_clone/app/bloc/media/media_cubit.dart';

class DetailScreen extends StatefulWidget {
  final Audio audio;

  const DetailScreen({super.key, required this.audio});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load audio when entering detail screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mediaCubit = BlocProvider.of<MediaCubit>(context);
      mediaCubit.setMedia(widget.audio);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              DetailCubit(DetailService())..loadHtmlContent(widget.audio.cfUrl),
      child: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(widget.audio.title)),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(DetailState state) {
    switch (state.loadStatus) {
      case LoadStatus.initial:
        return const DetailInitialView();
      case LoadStatus.loading:
        return const DetailLoadingView();
      case LoadStatus.success:
        // Update media cubit with HTML content
        if (state.htmlContent != null) {
          context.read<MediaCubit>().setMedia(widget.audio);
        }
        return DetailSuccessView(
          audio: widget.audio,
          state: state,
          appState: context.read<AppCubit>().state,
          scrollController: _scrollController,
        );
      case LoadStatus.failure:
        return const DetailErrorView();
    }
  }
}
