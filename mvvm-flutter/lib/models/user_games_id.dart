import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

class UserGamesIds extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get items => _favoriteItems;

  void add(int gameId) {
    _favoriteItems.add(gameId);
    print(gameId);
    notifyListeners();
  }

  void remove(int gameId) {
    _favoriteItems.remove(gameId);
    notifyListeners();
  }
}
