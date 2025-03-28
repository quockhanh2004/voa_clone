import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/favorite/favorite_state.dart';
import 'package:voa_clone/app/database/database.dart';
import 'package:voa_clone/model/media.dart';

class FavoriteCubit extends Cubit<FavoriteState> {

  FavoriteCubit(AppDatabase database) : super(const FavoriteState());

  Future<void> toggleFavorite(Media media) async {
    try {
      final newFavorites = List<Media>.from(state.favorites);
      if (state.favorites.contains(media)) {
        newFavorites.remove(media);
      } else {
        newFavorites.add(media);
      }
      emit(state.copyWith(favorites: newFavorites));

    } catch (e) {
      if (kDebugMode) {
        print('Error toggling favorite: $e');
      }
    }
  }

  bool isFavorite(Media media) {
    return state.favorites.contains(media);
  }
}
