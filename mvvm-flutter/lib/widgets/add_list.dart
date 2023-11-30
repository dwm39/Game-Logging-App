import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class AddList extends StatelessWidget {
  final List<VideoGameViewModel> games;

  const AddList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          title: Text(game.title),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
                                style: style,
                                onPressed: () {},
                                child: const Text('To Play'),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                style: style,
                                onPressed: () {},
                                child: const Text('Playing'),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                style: style,
                                onPressed: () {},
                                child: const Text('Played'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'))
                          ]));
            });
      },
    );
  }
}
