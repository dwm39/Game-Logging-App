import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/add_games_list_view_model.dart';
import 'package:mvvm_flutter/widgets/add_list.dart';

import 'package:provider/provider.dart';

class AddView extends StatefulWidget {
  UserGames users;
  AddView({super.key, required this.users});

  @override
  _AddListViewState createState() => _AddListViewState();
}

class _AddListViewState extends State<AddView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AddGamesListViewModel>(context, listen: false)
        .fetchMovies("mario"); // pikmin is filler here, can use whatever
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AddGamesListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Add Games')),
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
                child: AddList(
                    games: vm.videogames,
                    users: widget.users), //we will create this further down
              )
            ])));
  }
}
