import 'package:mvvm_flutter/models/video_game_details.dart';

class VideoGameDetailsViewModel {
  final VideoGameDetails videoGameDetails;

  VideoGameDetailsViewModel({required this.videoGameDetails});

  int get id {
    return this.videoGameDetails.id;
  }

  String get title {
    return this.videoGameDetails.title;
  }

  String get posterURL {
    return this.videoGameDetails.posterUrl;
  }

  String get releaseDate {
    return this.videoGameDetails.releaseDate;
  }

  String get summary {
    return this.videoGameDetails.summary;
  }
}
