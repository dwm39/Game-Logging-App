import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/models/user_games_id.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  static String routeName = '/favorites_page';
  UserGames users;
  UserGamesIds ids;
  FavoritesPage({super.key, required this.users, required this.ids});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController _controller = TextEditingController();

  List<VideoGameViewModel> searchResults = [];
  List<VideoGameViewModel> filterResults = [];

  String filter = "";
  String searchquery = "";

  @override
  void initState() {
    super.initState();
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              // ====================================
              // Search Bar
              // ====================================
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    searchquery = value;
                    updateList();
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              // ====================================
              // Sort buttons
              // ====================================
              Container(height: 20),
              Center(
                  child: SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor:
                              filter == "To Play" ? Colors.red : Colors.teal),
                      onPressed: () {
                        filter = filter == "To Play" ? "" : "To Play";
                        updateList();
                      },
                      child: const Text('To Play'),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor:
                              filter == "Playing" ? Colors.red : Colors.teal),
                      onPressed: () {
                        filter = filter == "Playing" ? "" : "Playing";
                        updateList();
                      },
                      child: const Text('Playing'),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor:
                              filter == "Played" ? Colors.red : Colors.teal),
                      onPressed: () {
                        filter = filter == "Played" ? "" : "Played";
                        updateList();
                      },
                      child: const Text('Played'),
                    ),
                  ],
                ),
              )),
              // ====================================
              // List
              // ====================================
              Expanded(
                  child: Consumer<UserGames>(
                builder: (context, _, child) => ListView.builder(
                  itemCount: filterResults.length,
                  itemBuilder: (context, index) => FavoriteItemTile(
                      filterResults[index], widget.users, widget.ids),
                ),
              ))
            ])));
  }

  updateList() async {
    // Filter by search.
    searchResults.clear();

    // Filter out all entries that do not follow the search criteria.
    widget.users.items.forEach((element) {
      if (element.title.toLowerCase().contains(searchquery.toLowerCase())) {
        searchResults.add(element);
      }
    });

    // Filter based on the state.
    filterResults.clear();

    // Filter out all entries that do not have the correct state.
    searchResults.forEach(((element) {
      if (element.state.contains(filter)) {
        filterResults.add(element);
      }
    }));

    setState(() {});
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
