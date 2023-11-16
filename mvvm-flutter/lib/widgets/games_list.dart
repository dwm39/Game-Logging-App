import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/views/single_game_view.dart';

class GameList extends StatelessWidget {
  final List<VideoGameViewModel> games;

  const GameList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];

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
              Navigator.pushNamed(context, '/details', arguments: game.id);
            });
      },
    );
  }
}
