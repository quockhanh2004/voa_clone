import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voa_clone/app/bloc/audios/audios_cubit.dart';
import 'package:voa_clone/app/bloc/audios/audios_state.dart';
import 'package:voa_clone/app/enums/load_status.dart';
import 'package:voa_clone/widgets/main_item.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late final AudiosCubit _audiosCubit;

  @override
  void initState() {
    super.initState();
    _audiosCubit = BlocProvider.of<AudiosCubit>(context);
    _audiosCubit.fetchAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AudiosCubit, AudiosState>(
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadStatus == LoadStatus.success) {
            if (state.audiosRe != null && state.audiosRe!.results.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async => await _audiosCubit.fetchAudios(),
                child: ListView.builder(
                  itemCount: state.audiosRe?.results.length ?? 0,
                  itemBuilder: (context, index) {
                    return MainItem(
                      media: state.audiosRe!.results[index],
                      onTap: () {
                        context.push(
                          '/detail',
                          extra: state.audiosRe!.results[index],
                        );
                      },
                    );
                  },
                ),
              );
            }
             else {
              return const Center(child: Text("No audio found"));
            }
          } else if (state.loadStatus == LoadStatus.failure) {
            return const Center(child: Text("Error loading audios"));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
