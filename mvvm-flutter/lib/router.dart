import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games.dart';
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
        final arg = settings.arguments as Map;
        final users = arg['users'];
        final ids = arg['ids'];
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => VideoGamesListViewModel(),
                  child: GameListView(users: users, ids: ids),
                ));
      case '/details':
        // var oneGame = settings.arguments as VideoGameViewModel;
        final arg = settings.arguments as Map;
        final game = arg['oneGame'];
        final users = arg['users'];
        final ids = arg['ids'];
        bool toPlay = arg['toPlay'];
        bool isPlaying = arg['playing'];
        bool played = arg['played'];
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => VideoGamesListViewModel(),
                  child: SingleGameView(
                      oneGame: game,
                      users: users,
                      ids: ids,
                      toPlay: toPlay,
                      isPlaying: isPlaying,
                      played: played),
                ));

      case '/add':
        final arg = settings.arguments as Map;
        final game = arg['oneGame'];
        final users = arg['users'];
        final ids = arg['ids'];
        bool toPlay = arg['toPlay'];
        bool isPlaying = arg['playing'];
        bool played = arg['played'];
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<UserGames>(
            create: (context) => UserGames(),
            child: AddGameView(
                oneGame: game,
                users: users,
                ids: ids,
                toPlay: toPlay,
                isPlaying: isPlaying,
                played: played),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
