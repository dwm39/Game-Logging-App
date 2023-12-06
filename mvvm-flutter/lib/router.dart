import 'package:flutter/material.dart';
import 'package:mvvm_flutter/views/video_games_list_view.dart';
import 'package:mvvm_flutter/views/single_game_view.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/viewmodels/add_games_list_view_model.dart';
import 'package:mvvm_flutter/views/single_add_view.dart';
import 'package:mvvm_flutter/widgets/add_list.dart';
import 'package:provider/provider.dart';

//import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => VideoGamesListViewModel(),
                  child: const GameListView(),
                ));
      case '/details':
        var oneGame = settings.arguments as VideoGameViewModel;
        return MaterialPageRoute(
            builder: (_) =>
                //Feed(imdbID));
                ChangeNotifierProvider(
                  create: (context) => VideoGamesListViewModel(),
                  child: SingleGameView(oneGame),
                ));

      case '/add':
        final game = settings.arguments as VideoGameViewModel;
        return MaterialPageRoute(
            builder: (_) =>
                //Feed(imdbID));
                ChangeNotifierProvider(
                  create: (context) => AddGamesListViewModel(),
                  child: AddGameView(oneGame: game),
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
