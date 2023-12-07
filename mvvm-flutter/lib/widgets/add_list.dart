import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games_id.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/main.dart';

class AddList extends StatefulWidget {
  final List<VideoGameViewModel> games;
  final UserGames users;
  final UserGamesIds ids;
  const AddList(
      {super.key, required this.games, required this.users, required this.ids});
  @override
  AddList2 createState() => AddList2();
}

class AddList2 extends State<AddList> {
  // try this tommorrow before working on speech // do the isPressed thing

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
              Navigator.pushNamed(
                  context,
                  // MaterialPageRoute(
                  //     //builder: (context) => const ElevatedButtonExampleApp()),
                  //     builder: (context) => SingleGameView(1024)),

                  '/add',
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
