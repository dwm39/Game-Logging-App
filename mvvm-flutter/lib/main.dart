import 'package:flutter/material.dart';
import 'package:mvvm_flutter/views/video_games_list_view.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/add_games_list_view_model.dart';
import 'package:mvvm_flutter/views/add_view.dart';
import 'package:provider/provider.dart';

import 'router.dart' as LocalRouter;

void main() => runApp(const App());

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: ChangeNotifierProvider(
//         create: (context) => VideoGamesListViewModel(),
//         child: const BottomNavigationBarExample(),
//       ),
//       onGenerateRoute: LocalRouter.Router.generateRoute,
//       initialRoute: '/',
//     );
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ChangeNotifierProvider(
        create: (context) => VideoGamesListViewModel(),
        child: const BottomNavigationBarExample(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: '/',
    );
  }
}

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: '/',
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => VideoGamesListViewModel(),
      child: const GameListView(),
    )),
    Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => AddGamesListViewModel(),
      child: const AddView(),
    )),
    const Scaffold(
      body: Center(child: Text('This will be the Library pleease')),
      //same here
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
