import 'package:flutter/material.dart';
import 'package:mvvm_flutter/views/video_games_list_view.dart';
import 'package:mvvm_flutter/viewmodels/video_games_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/add_games_list_view_model.dart';
import 'package:mvvm_flutter/views/add_view.dart';
import 'package:mvvm_flutter/views/library_view.dart';
import 'package:mvvm_flutter/models/user_games.dart';
import 'package:provider/provider.dart';

import 'router.dart' as LocalRouter;

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final users = Provider.of<UserGames>(context);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (context) => VideoGamesListViewModel(),
//           ),
//           ChangeNotifierProvider(
//             create: (context) => UserGames(),
//           ),
//         ],
//         child: BottomNavigationBarExampleApp(users: users),
//       ),
//       onGenerateRoute: LocalRouter.Router.generateRoute,
//       initialRoute: '/',
//     );
//   }
// }

// class BottomNavigationBarExampleApp extends StatelessWidget {
//   UserGames users;
//   BottomNavigationBarExampleApp({super.key, required this.users});

//   @override
//   Widget build(BuildContext context) {
//     final users = Provider.of<UserGames>(context);
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: BottomNavigationBarExample(users: users),
//       onGenerateRoute: LocalRouter.Router.generateRoute,
//       initialRoute: '/',
//     );
//   }
// }

// class BottomNavigationBarExample extends StatefulWidget {
//   UserGames users;
//   BottomNavigationBarExample({super.key, required this.users});

//   @override
//   State<BottomNavigationBarExample> createState() =>
//       _BottomNavigationBarExampleState(users: users);
// }

// class _BottomNavigationBarExampleState
//     extends State<BottomNavigationBarExample> {
//   UserGames users;
//   _BottomNavigationBarExampleState({required this.users});
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   final List<Widget> _widgetOptions = <Widget>[
//     Scaffold(
//         body: ChangeNotifierProvider(
//       create: (context) => VideoGamesListViewModel(),
//       child: const GameListView(),
//     )),
//     Scaffold(
//         body: MultiProvider(providers: [
//       ChangeNotifierProvider(
//         create: (context) => AddGamesListViewModel(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => UserGames(),
//       ),
//     ], child: AddView(users: users))),
//     Scaffold(
//         body: ChangeNotifierProvider(
//       create: (context) => UserGames(),
//       child: const FavoritesPage(),
//     )),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final users = widget.users;
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_book),
//             label: 'Library',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

/// Flutter code sample for [NavigationBar].

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
        ], child: AddView(users: users))),
        Scaffold(
            body: ChangeNotifierProvider(
          create: (context) => VideoGamesListViewModel(),
          child: FavoritesPage(users: users),
        )),
      ][currentPageIndex],
    );
  }
}
