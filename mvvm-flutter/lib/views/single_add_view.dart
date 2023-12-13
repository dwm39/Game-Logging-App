import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games_id.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/main.dart';
import 'package:provider/provider.dart';

class AddGameView extends StatefulWidget {
  final VideoGameViewModel oneGame;
  final UserGames users;
  final UserGamesIds ids;
  bool toPlay;
  bool isPlaying;
  bool played;

  String review = "";

  AddGameView(
      {super.key,
      required this.oneGame,
      required this.users,
      required this.ids,
      required this.toPlay,
      required this.isPlaying,
      required this.played});
  @override
  AddGameView2 createState() => AddGameView2();
}

class AddGameView2 extends State<AddGameView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Make sure the text field and the thing being controlled by the text field have the review, if applicable.
    _controller.text = widget.oneGame.review;
    widget.review = widget.oneGame.review;
  }

  @override
  Widget build(BuildContext context) {
    //widget.oneGame.state = "To Play";
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
              TableRow(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    "Review:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: _controller,
                      style: const TextStyle(fontSize: fontSize),
                      maxLines: 6,
                      minLines: 6,
                      readOnly: false,
                      decoration: const InputDecoration(
                        labelText: 'Personal Review',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String newText) {
                        widget.review = newText;
                      }),
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
                      backgroundColor:
                          widget.toPlay ? Colors.red : Colors.teal),
                  onPressed: () {
                    //widget.oneGame.state = "To Play";
                    setState(() {
                      widget.toPlay = !widget.toPlay;
                      widget.isPlaying = false;
                      widget.played = false;
                    });
                  },
                  child: const Text('To Play'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor:
                          widget.isPlaying ? Colors.red : Colors.teal),
                  onPressed: () {
                    //widget.oneGame.state = "Playing";
                    setState(() {
                      widget.toPlay = false;
                      widget.isPlaying = !widget.isPlaying;
                      widget.played = false;
                    });
                  },
                  child: const Text('Playing'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor:
                          widget.played ? Colors.red : Colors.teal),
                  onPressed: () {
                    //widget.oneGame.state = "Played";
                    setState(() {
                      widget.toPlay = false;
                      widget.isPlaying = false;
                      widget.played = !widget.played;
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
              widget.oneGame.review = widget.review;
              if (widget.toPlay) {
                if (!widget.ids.items.contains(widget.oneGame.id)) {
                  widget.ids.add(widget.oneGame.id);
                  widget.users.add(widget.oneGame);
                }
                widget.users.remove(widget.oneGame);
                widget.oneGame.state = "To Play";
                widget.users.add(widget.oneGame);
              } else if (widget.isPlaying) {
                if (!widget.ids.items.contains(widget.oneGame.id)) {
                  widget.ids.add(widget.oneGame.id);
                  widget.users.add(widget.oneGame);
                }
                widget.users.remove(widget.oneGame);
                widget.oneGame.state = "Playing";
                widget.users.add(widget.oneGame);
              } else if (widget.played) {
                if (!widget.ids.items.contains(widget.oneGame.id)) {
                  widget.ids.add(widget.oneGame.id);
                  widget.users.add(widget.oneGame);
                }
                widget.users.remove(widget.oneGame);
                widget.oneGame.state = "Played";
                widget.users.add(widget.oneGame);
              } else {
                widget.ids.remove(widget.oneGame.id);
                widget.users.remove(widget.oneGame);
                print("noting");
              }
              // !widget.ids.items.contains(widget.oneGame.id)
              //     ? widget.ids.add(widget.oneGame.id)
              //     : widget.ids.remove(widget.oneGame.id);
              // !widget.users.items.contains(widget.oneGame)
              //     ? widget.users.add(widget.oneGame)
              //     : widget.users.remove(widget.oneGame);
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ])));
  }
}
