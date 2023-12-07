import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/main.dart';
import 'package:provider/provider.dart';

class AddGameView extends StatefulWidget {
  final VideoGameViewModel oneGame;
  final UserGames users;
  const AddGameView({super.key, required this.oneGame, required this.users});
  @override
  AddGameView2 createState() => AddGameView2();
}

class AddGameView2 extends State<AddGameView> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  @override
  Widget build(BuildContext context) {
    const fontSize = 16.0;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(title: Text(widget.oneGame.title)),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(height: 50),
          // Game Image
          Image.network(
            widget.oneGame.poster,
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
                    widget.oneGame.title,
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
                    widget.oneGame.rating,
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
                    widget.oneGame.releaseDate,
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
              ]),
              const TableRow(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Review:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: TextField(
                    style: TextStyle(fontSize: 25),
                    maxLines: 6,
                    minLines: 6,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Comming Soon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ]),
            ],
          ),
          // ===========================================================================
          // Buttons at Bottom development here
          // ===========================================================================
          Container(height: 30),
          Center(
              child: SingleChildScrollView(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: isPressed1 ? Colors.red : Colors.teal),
                  onPressed: () {
                    setState(() {
                      isPressed1 = true;
                      isPressed2 = false;
                      isPressed3 = false;
                    });
                  },
                  child: const Text('To Play'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: isPressed2 ? Colors.red : Colors.teal),
                  onPressed: () {
                    setState(() {
                      isPressed1 = false;
                      isPressed2 = true;
                      isPressed3 = false;
                    });
                  },
                  child: const Text('Playing'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: isPressed3 ? Colors.red : Colors.teal),
                  onPressed: () {
                    setState(() {
                      isPressed1 = false;
                      isPressed2 = false;
                      isPressed3 = true;
                    });
                  },
                  child: const Text('Played'),
                ),
              ],
            ),
          )),
          // ===========================================================================
          // Submit Button
          // ===========================================================================
          Container(height: 25),
          ElevatedButton(
            style:
                TextButton.styleFrom(backgroundColor: const Color(0xff777777)),
            onPressed: () {
              !widget.users.items.contains(widget.oneGame)
                  ? widget.users.add(widget.oneGame)
                  : widget.users.remove(widget.oneGame);
            },
            child: const Text('Submit'),
          ),
        ])));
  }
}
