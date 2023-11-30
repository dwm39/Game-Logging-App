import 'dart:convert';
import 'package:mvvm_flutter/models/video_game.dart';
import 'package:http/http.dart' as http;

class Webservice {
  // why is the question
  Future<List<VideoGame>> fetchMovies(String keyword) async {
    String url =
        "https://api.igdb.com/v4/games?search=$keyword&fields=name,url,release_dates.human,summary,rating,cover.url&limit=50";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Client-ID": "e12emyr01qnr2rpev2ez8v7ixo1gzq",
        "Authorization": "Bearer ehqka6bhofnxbkgta0blvdr09uwl5r"
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body;
      return json.map((game) => VideoGame.fromJson(game)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
