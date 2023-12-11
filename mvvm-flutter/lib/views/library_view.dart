import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/models/user_games_id.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';
  UserGames users;
  UserGamesIds ids;
  FavoritesPage({super.key, required this.users, required this.ids});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<UserGames>(
        builder: (context, users2, child) => ListView.builder(
          itemCount: users2.items.length,
          itemBuilder: (context, index) =>
              FavoriteItemTile(users2.items[index], users, ids),
        ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final VideoGameViewModel itemNo;
  final UserGames users;
  final UserGamesIds ids;

  const FavoriteItemTile(this.itemNo, this.users, this.ids, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(itemNo.poster)),
              borderRadius: BorderRadius.circular(6)),
          width: 50,
          height: 1000,
        ),
        title: Text(itemNo.title),
        subtitle: Text(itemNo.state),
        isThreeLine: true,
        onTap: () {
          bool toPlay = false;
          bool isPlaying = false;
          bool played = false;
          String state = itemNo.state;
          if (state == "To Play") {
            toPlay = true;
          }
          if (state == "Playing") {
            isPlaying = true;
          }
          if (state == "Played") {
            played = true;
          }
          Navigator.pushNamed(context, '/add',
              arguments: ({
                'oneGame': itemNo,
                'users': users, // UserGames
                'ids': ids, // UserGamesIds
                'toPlay': toPlay,
                'playing': isPlaying,
                'played': played,
              }));
        });
  }
}
