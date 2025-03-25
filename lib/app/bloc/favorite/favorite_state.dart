import 'package:equatable/equatable.dart';
import 'package:voa_clone/model/media.dart';

class FavoriteState extends Equatable {
  final List<Media> favorites;

  const FavoriteState({this.favorites = const []});

  FavoriteState copyWith({List<Media>? favorites}) {
    return FavoriteState(favorites: favorites ?? this.favorites);
  }

  @override
  List<Object?> get props => [favorites];
}
