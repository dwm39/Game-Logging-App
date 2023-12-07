import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class UserGames extends ChangeNotifier {
  final List<VideoGameViewModel> _favoriteItems = [];

  List<VideoGameViewModel> get items => _favoriteItems;

  void add(VideoGameViewModel game) {
    _favoriteItems.add(game);
    notifyListeners();
    print(items.length);
  }

  void remove(VideoGameViewModel game) {
    _favoriteItems.remove(game);
    notifyListeners();
    print(items.length);
  }
}
