import 'package:flutter/material.dart';
import 'package:mvvm_flutter/views/video_games_list_view.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/add_games_list_view_model.dart';
import 'package:mvvm_flutter/views/add_view.dart';
import 'package:mvvm_flutter/views/library_view.dart';
import 'package:mvvm_flutter/models/user_games.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => VideoGamesListViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserGames(),
          ),
        ],
        child: const BottomNavigationBarExampleApp(),
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
    final users = Provider.of<UserGames>(context);
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: BottomNavigationBarExample(users: users),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: '/',
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  UserGames users;
  BottomNavigationBarExample({super.key, required this.users});

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
        body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => AddGamesListViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserGames(),
      ),
    ], child: AddView())),
    Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => UserGames(),
      child: const FavoritesPage(),
    )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserGames>(context);
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
