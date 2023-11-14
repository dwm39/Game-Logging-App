import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';

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

// class SingleGameView extends StatefulWidget {
//   const SingleGameView({super.key});

//   @override
//   _SingleGameViewState createState() => _SingleGameViewState();
// }

// class _SingleGameViewState extends State<SingleGameView> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<VideoGameViewModel>(context, listen: false).get("title");
//   }
// }

class SingleGameView extends StatefulWidget {
  final String igdbID;

  SingleGameView(this.igdbID);

  @override
  _SingleGameViewState createState() => _SingleGameViewState();
}

class _SingleGameViewState extends State<SingleGameView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<VideoGameViewModel>(context, listen: false)
        .fetchGameDetails(widget.igdbID);
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }
}
