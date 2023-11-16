import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/viewmodels/video_game_details_view_model.dart';
import 'package:mvvm_flutter/viewmodels/video_game_info_view_model.dart';
import 'package:mvvm_flutter/widgets/games_list.dart';

import 'package:provider/provider.dart';

/// Flutter code sample for [ElevatedButton].

class ElevatedButtonExampleApp extends StatelessWidget {
  const ElevatedButtonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Single Game View')),
        body: const ElevatedButtonExample(),
      ),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    // game set state
    return Center(
      child: Row(
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
    );
  }
}

// ===========================================================================
// Start SingleGameView development here
// ===========================================================================

class SingleGameView extends StatefulWidget {
  final int igdbID;

  SingleGameView(this.igdbID);

  @override
  _SingleGameViewState createState() => _SingleGameViewState();
}

// This is fake game data. Replace this.
class FakeGameData {
  final String title = "Pikmin 4";
  final String releaseDate = "July 21, 2023";
  final String summary =
      "Apparently diverging from the events of the prior installments, Captain Olimar travels to PNF-404, an Earth-like planet, aboard his ship the SS Dolphin. A freak accident causes his ship to crash land, and he is forced to recruit Pikmin to help him find the ship's missing parts.";
}

class _SingleGameViewState extends State<SingleGameView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<VideoGameInfoViewModel>(context, listen: false)
    //     .fetchVideoGameDetails(widget.igdbID);
  }

  @override
  Widget build(BuildContext context) {
    final vm = FakeGameData();
    //Provider.of<VideoGameInfoViewModel>(context);

    const fontSize = 16.0;

    return Scaffold(
        appBar: AppBar(title: Text(vm.title)),
        body: Column(children: [
          Container(height: 50),
          // Image(image: FileImage(File('lib/views/pikmin.jpg'))),
          Image.asset(
            'lib/images/pikmin.jpg',
            height: 200,
            width: 200,
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: <TableRow>[
              TableRow(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Title:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    // vm.details != null ? vm.details!.title : "",
                    vm.title,
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Release Date:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    // vm.details != null ? vm.details!.releaseDate : "",
                    vm.releaseDate,
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Summary:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    // vm.details != null
                    //     ? vm.details!.summary
                    //     : "vm.details is null",
                    vm.summary,
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
            ],
          ),
          Container(height: 150),
          const ElevatedButtonExample()
        ]));
  }
}
