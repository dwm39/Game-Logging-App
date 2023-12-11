import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

class SingleGameView extends StatelessWidget {
  final VideoGameViewModel oneGame;

  const SingleGameView(this.oneGame, {super.key});
  @override
  Widget build(BuildContext context) {
    final vm = oneGame;
    //Provider.of<VideoGameInfoViewModel>(context);
    const fontSize = 16.0;

    return Scaffold(
        appBar: AppBar(title: Text(oneGame.title)),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(height: 50),
          // Image(image: FileImage(File('lib/views/pikmin.jpg'))),
          Image.network(
            vm.poster,
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
                  padding: const EdgeInsets.all(2),
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
                    "Rating:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    vm.rating,
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
                  padding: const EdgeInsets.all(2),
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
                  padding: const EdgeInsets.all(2),
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
          Container(height: 50),
          const ElevatedButtonExample()
        ])));
  }
}

/// Flutter code sample for [ElevatedButton].

class ElevatedButtonExampleApp extends StatelessWidget {
  const ElevatedButtonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(title: const Text('Single Game View')),
        body: const ElevatedButtonExample(),
      ),
    ));
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
    const fontSize = 16.0;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    // game set state
    return Center(
        child: SingleChildScrollView(
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
          // change background color for if game is in a state
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {},
          child: const Text('Played'),
        ),
      ]),
    ));
  }
}

// ===========================================================================
// Start SingleGameView development here
// ===========================================================================

