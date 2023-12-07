import 'package:flutter/material.dart';
import 'package:mvvm_flutter/models/user_games_id.dart';
import 'package:mvvm_flutter/views/video_games_list_view.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/add_games_list_view_model.dart';
import 'package:mvvm_flutter/views/add_view.dart';
import 'package:mvvm_flutter/views/library_view.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:mvvm_flutter/models/video_game.dart';
import 'package:provider/provider.dart';

import 'router.dart' as LocalRouter;

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => VideoGamesListViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserGames(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserGamesIds(),
          ),
        ],
        child: const NavigationExample(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: '/',
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserGames>(context);
    final ids = Provider.of<UserGamesIds>(context);
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Library',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
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
        ], child: AddView(users: users, ids: ids))),
        Scaffold(
            body: ChangeNotifierProvider(
          create: (context) => VideoGamesListViewModel(),
          child: FavoritesPage(users: users),
        )),
      ][currentPageIndex],
    );
  }
}
