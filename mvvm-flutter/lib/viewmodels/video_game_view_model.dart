import 'package:mvvm_flutter/models/video_game.dart';

class VideoGameViewModel implements Comparable {
  final VideoGame game;

  VideoGameViewModel({required this.game});

  int get id {
    return game.id;
  }

  String get title {
    return game.title;
  }

  String get poster {
    return game.posterUrl;
  }

  String get releaseDate {
    return game.releaseDate;
  }

  String get synopsis {
    return game.synopsis;
  }

  String get summary {
    return game.summary;
  }

  String get rating {
    return game.rating;
  }

  set rating(String rating) {
    game.rating = rating;
  }

  String get state {
    return game.state;
  }

  set state(String state) {
    game.state = state;
  }

  String get review {
    return game.review;
  }

  set review(String review) {
    game.review = review;
  }

  @override
  int compareTo(other) {
    if (this.game.title == null || other == null) {
      return 0;
    }
    return this.game.title.compareTo(other.game.title);
  }
}
