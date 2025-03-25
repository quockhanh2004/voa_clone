import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final List<String> favoriteArticleIds;

  const Favorite({this.favoriteArticleIds = const []});

  Favorite copyWith({List<String>? favoriteArticleIds}) {
    return Favorite(
      favoriteArticleIds: favoriteArticleIds ?? this.favoriteArticleIds,
    );
  }

  @override
  List<Object?> get props => [favoriteArticleIds];
}
