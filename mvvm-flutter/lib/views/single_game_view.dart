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
  // final String igdbID;
  final int igdbID;

  SingleGameView(this.igdbID);

  @override
  _SingleGameViewState createState() => _SingleGameViewState();
}

class _SingleGameViewState extends State<SingleGameView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<VideoGameInfoViewModel>(context, listen: false)
        .fetchVideoGameDetails(widget.igdbID);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VideoGameInfoViewModel>(context);

    const fontSize = 16.0;

    return Scaffold(
        appBar: AppBar(title: const Text('Single Game View')),
        body: Column(children: [
          Container(height: 50),
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
                    vm.details != null ? vm.details!.title : "",
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Actors:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    vm.details != null ? vm.details!.releaseDate : "",
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Directors:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    vm.details != null ? vm.details!.summary : "",
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
            ],
          ),
        ]));
  }
}
