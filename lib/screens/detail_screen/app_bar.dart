import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/app_cubit.dart';
import 'package:voa_clone/app/bloc/app_state.dart';
import 'package:voa_clone/app/bloc/favorite/favorite_cubit.dart';
import 'package:voa_clone/app/bloc/favorite/favorite_state.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/screens/detail_screen/detail_setting_dialog.dart';

AppBar buildAppBar(BuildContext context, Audio audio) {
  return AppBar(
    title: Text(
      audio.title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    backgroundColor: Colors.blueAccent,
    iconTheme: const IconThemeData(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    actions: [
      BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const DetailSettingDialog(),
              );
            },
            icon: const Icon(Icons.settings_applications_sharp),
          );
        },
      ),
      BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, favoriteState) {
          final isFavorite = context.read<FavoriteCubit>().isFavorite(audio);

          return IconButton(
            onPressed: () {
              context.read<FavoriteCubit>().toggleFavorite(audio);
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: Colors.white,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      audio.likeCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    ],
  );
}
