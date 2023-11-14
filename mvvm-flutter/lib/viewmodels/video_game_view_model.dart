import 'package:mvvm_flutter/models/video_game.dart';

class VideoGameViewModel {
  final VideoGame game;

  VideoGameViewModel({required this.game});

  String get title {
    return game.title;
  }

  String get poster {
    return game.posterUrl;
  }

  String get releaseDate {
    return game.releaseDate;
  }
}
