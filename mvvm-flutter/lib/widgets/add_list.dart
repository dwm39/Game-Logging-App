import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/video_game_view_model.dart';

class AddList extends StatefulWidget {
  final List<VideoGameViewModel> games;
  const AddList({super.key, required this.games});
  @override
  AddList2 createState() => AddList2();
}

class AddList2 extends State<AddList> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return ListView.builder(
      itemCount: widget.games.length,
      itemBuilder: (context, index) {
        final game = widget.games[index];

        return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(game.poster)),
                  borderRadius: BorderRadius.circular(6)),
              width: 50,
              height: 1000,
            ),
            title: Text(game.title),
            subtitle: Text(game.releaseDate),
            isThreeLine: true,
            onTap: () {
              // showModalBottomSheet(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 textStyle: const TextStyle(fontSize: 20),
              //                 backgroundColor:
              //                     isPressed1 ? Colors.red : Colors.teal),
              //             onPressed: () {
              //               setState(() {
              //                 isPressed1 = true;
              //                 isPressed2 = false;
              //                 isPressed3 = false;
              //               });
              //             },
              //             child: const Text('To Play'),
              //           ),
              //           const SizedBox(width: 30),
              //           ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 textStyle: const TextStyle(fontSize: 20),
              //                 backgroundColor:
              //                     isPressed2 ? Colors.red : Colors.teal),
              //             onPressed: () {
              //               setState(() {
              //                 isPressed1 = false;
              //                 isPressed2 = !isPressed2;
              //                 isPressed3 = false;
              //               });
              //             },
              //             child: const Text('Playing'),
              //           ),
              //           const SizedBox(width: 30),
              //           ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 textStyle: const TextStyle(fontSize: 20),
              //                 backgroundColor:
              //                     isPressed3 ? Colors.red : Colors.teal),
              //             onPressed: () {
              //               setState(() {
              //                 isPressed1 = false;
              //                 isPressed2 = false;
              //                 isPressed3 = !isPressed3;
              //               });
              //             },
              //             child: const Text('Played'),
              //           ),
              //         ],
              //       );
              //     });
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          title: Text(game.title),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    backgroundColor:
                                        isPressed1 ? Colors.red : Colors.teal),
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
                                    backgroundColor:
                                        isPressed2 ? Colors.red : Colors.teal),
                                onPressed: () {
                                  setState(() {
                                    isPressed1 = false;
                                    isPressed2 = !isPressed2;
                                    isPressed3 = false;
                                  });
                                },
                                child: const Text('Playing'),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    backgroundColor:
                                        isPressed3 ? Colors.red : Colors.teal),
                                onPressed: () {
                                  setState(() {
                                    isPressed1 = false;
                                    isPressed2 = false;
                                    isPressed3 = !isPressed3;
                                  });
                                },
                                child: const Text('Played'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'))
                          ]));
            });
      },
    );
  }
}
