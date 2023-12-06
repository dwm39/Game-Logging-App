import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/main.dart';

class AddList extends StatefulWidget {
  final List<VideoGameViewModel> games;

  const AddList({super.key, required this.games});
  @override
  AddList2 createState() => AddList2();
}

class AddList2 extends State<AddList> {
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
              Navigator.pushNamed(
                  context,
                  // MaterialPageRoute(
                  //     //builder: (context) => const ElevatedButtonExampleApp()),
                  //     builder: (context) => SingleGameView(1024)),
                  '/add',
                  arguments: (game));
            });
      },
    );
  }
}
