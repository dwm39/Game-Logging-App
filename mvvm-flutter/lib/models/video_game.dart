class VideoGame {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final String synopsis;
  final String summary;
  final String rating;

  VideoGame(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.releaseDate,
      required this.synopsis,
      required this.summary,
      required this.rating});

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    String releaseDateHuman = "TBD";
    if (json["release_dates"] != null) {
      releaseDateHuman = json["release_dates"][0]["human"];
    }
    String jsonStuff = "//demofree.sirv.com/nope-not-here.jpg";
    if (json["cover"] != null) {
      jsonStuff = json["cover"]["url"];
      jsonStuff = jsonStuff.replaceFirst('t_thumb', 't_1080p');
    }
    String summary = "";
    if (json["summary"] != null) {
      summary = json["summary"];
    }
    double rating = 0;
    String rating2 = "Rating Not Available";
    if (json["rating"] != null) {
      rating = json["rating"];
      rating2 = rating.toStringAsFixed(1);
    }

    return VideoGame(
      id: json["id"],
      title: json["name"],
      posterUrl: 'http:$jsonStuff',
      releaseDate: releaseDateHuman,
      synopsis: summary,
      summary: summary,
      rating: rating2,
    );
  }
}
