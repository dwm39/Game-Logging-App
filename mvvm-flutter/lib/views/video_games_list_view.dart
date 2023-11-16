import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/widgets/games_list.dart';

import 'package:provider/provider.dart';

class GameListView extends StatefulWidget {
  const GameListView({super.key});

  @override
  _GameListViewState createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<VideoGamesListViewModel>(context, listen: false)
        .fetchMovies("pikmin"); // pikmin is filler here, can use whatever
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VideoGamesListViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('List View')),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              // search bar
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      vm.fetchMovies(value);
                      _controller.clear();
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),

              Expanded(
                  child: GameList(
                      games: vm.videogames)) //we will create this further down
            ])));
  }
}
