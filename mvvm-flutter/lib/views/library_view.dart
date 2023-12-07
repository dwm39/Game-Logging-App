import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';
  UserGames users;
  FavoritesPage({super.key, required this.users});

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
              FavoriteItemTile(users2.items[index]),
        ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final VideoGameViewModel itemNo;

  const FavoriteItemTile(this.itemNo, {super.key});

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
        subtitle: Text(itemNo.releaseDate),
        isThreeLine: true,
        onTap: () {});
  }
}
