import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/models/user_games_id.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

class GameList extends StatefulWidget {
  final List<VideoGameViewModel> games;
  final UserGames users;
  final UserGamesIds ids;

  const GameList(
      {super.key, required this.games, required this.users, required this.ids});

  @override
  GameList2 createState() => GameList2();
}

class GameList2 extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.games.length,
      itemBuilder: (context, index) {
        final game = widget.games[index];

        return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(game.poster)),
                  borderRadius: BorderRadius.circular(6)),
              width: 50,
              height: 1000,
            ),
            title: Text(game.title),
            subtitle: Text(game.releaseDate),
            isThreeLine: true,
            onTap: () {
              bool toPlay = false;
              bool isPlaying = false;
              bool played = false;
              String state = widget.users.getState(game);
              if (state == "To Play") {
                toPlay = true;
              }
              if (state == "Playing") {
                isPlaying = true;
              }
              if (state == "Played") {
                played = true;
              }
              Navigator.pushNamed(context, '/details',
                  arguments: ({
                    'oneGame': game,
                    'users': widget.users,
                    'ids': widget.ids,
                    'toPlay': toPlay,
                    'playing': isPlaying,
                    'played': played,
                  }));
            });
      },
    );
  }
}
