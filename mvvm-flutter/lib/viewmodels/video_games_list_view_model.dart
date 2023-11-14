import 'package:flutter/material.dart';
import 'package:mvvm_flutter/web_service.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

class VideoGamesListViewModel extends ChangeNotifier {
  List<VideoGameViewModel> videogames = <VideoGameViewModel>[];

  Future<void> fetchMovies(String keyword) async {
    final results = await Webservice().fetchMovies(keyword);
    videogames = results.map((item) => VideoGameViewModel(game: item)).toList();
    notifyListeners();
  }
}
