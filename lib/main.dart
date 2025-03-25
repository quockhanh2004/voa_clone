import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voa_clone/app/bloc/app_cubit.dart';
import 'package:voa_clone/app/bloc/audios/audios_cubit.dart';
import 'package:voa_clone/app/bloc/videos/videos_cubit.dart';
import 'package:voa_clone/app/bloc/media/media_cubit.dart';
import 'package:voa_clone/app/bloc/favorite/favorite_cubit.dart';
import 'package:voa_clone/model/response_audio.dart';
import 'package:voa_clone/model/response_video.dart';
import 'package:voa_clone/screens/home_screen.dart';
import 'package:voa_clone/screens/detail_screen/detail_screen.dart';
import 'package:voa_clone/app/database/database.dart';
import 'package:voa_clone/app/providers/database_provider.dart';
import 'package:voa_clone/screens/video_screen/video_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  final database = AppDatabase();

  runApp(
    DatabaseProvider(database: database, child: MyApp(database: database)),
  );
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  MyApp({super.key, required this.database});

  late final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final Audio audio = state.extra as Audio;
          return DetailScreen(audio: audio);
        },
      ),
      GoRoute(
        path: '/video',
        builder: (context, state) {
          final Video video = state.extra as Video;
          return VideoPlayerScreen(video: video);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DatabaseProvider(
      database: database,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()),
          BlocProvider(create: (context) => AudiosCubit(database)),
          BlocProvider(create: (context) => VideosCubit(database)),
          BlocProvider(create: (context) => MediaCubit()),
          BlocProvider(create: (context) => FavoriteCubit(database)),
        ],
        child: MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

// Cấu hình GoRouter
