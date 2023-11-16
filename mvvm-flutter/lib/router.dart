import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_info_view_model.dart';
import 'package:mvvm_flutter/views/video_games_list_view.dart';
import 'package:mvvm_flutter/views/single_game_view.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:provider/provider.dart';

//import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => VideoGamesListViewModel(),
                  child: GameListView(),
                ));
      case '/details':
        var igdbID = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                //Feed(imdbID));
                ChangeNotifierProvider(
                  create: (context) => VideoGameInfoViewModel(),
                  child: SingleGameView(igdbID),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
