import 'package:mvvm_flutter/models/video_game.dart';

class VideoGameViewModel {
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

  String get state {
    return game.state;
  }

  set state(String state) {
    this.state = state;
  }
}
